from collections import OrderedDict
from model.Discriminator import *
import torch
from torch import nn as nn
from loss.vat import static_get_normalized_vector


class Id(nn.Module):
    def __init__(self):
        super(Id, self).__init__()

    def forward(self, x):
        return x


class AlexNetCaffe(nn.Module):
    def __init__(self, num_classes=100, domains=3, dropout=True):
        super(AlexNetCaffe, self).__init__()
        print("Using Caffe AlexNet")
        self.features = nn.Sequential(OrderedDict([
            ("conv1", nn.Conv2d(3, 96, kernel_size=11, stride=4)),
            ("relu1", nn.ReLU(inplace=False)),
            ("pool1", nn.MaxPool2d(kernel_size=3, stride=2, ceil_mode=True)),
            ("norm1", nn.LocalResponseNorm(5, 1.e-4, 0.75)),
            ("conv2", nn.Conv2d(96, 256, kernel_size=5, padding=2, groups=2)),
            ("relu2", nn.ReLU(inplace=False)),
            ("pool2", nn.MaxPool2d(kernel_size=3, stride=2, ceil_mode=True)),
            ("norm2", nn.LocalResponseNorm(5, 1.e-4, 0.75)),
            ("conv3", nn.Conv2d(256, 384, kernel_size=3, padding=1)),
            ("relu3", nn.ReLU(inplace=False)),
            ("conv4", nn.Conv2d(384, 384, kernel_size=3, padding=1, groups=2)),
            ("relu4", nn.ReLU(inplace=False)),
            ("conv5", nn.Conv2d(384, 256, kernel_size=3, padding=1, groups=2)),
            ("relu5", nn.ReLU(inplace=False)),
            ("pool5", nn.MaxPool2d(kernel_size=3, stride=2, ceil_mode=True)),
        ]))
        self.classifier = nn.Sequential(OrderedDict([
            ("fc6", nn.Linear(256 * 6 * 6, 4096)),
            ("relu6", nn.ReLU(inplace=True)),
            ("drop6", nn.Dropout() if dropout else Id()),
            ("fc7", nn.Linear(4096, 4096)),
            ("relu7", nn.ReLU(inplace=True)),
            ("drop7", nn.Dropout() if dropout else Id())]))

        self.class_classifier = nn.Linear(4096, num_classes)

    def forward(self, x, lambda_val=0):
        x = self.features(x*57.6)
        # 57.6 is the magic number needed to bring torch data back to the range of caffe data, based on used std
        x = x.view(x.size(0), -1)
        x = self.classifier(x)
        return self.class_classifier(x)


def caffenet(num_classes, num_domains=None, pretrained=True):
    model = AlexNetCaffe(num_classes)
    for m in model.modules():
        if isinstance(m, nn.Linear):
            nn.init.xavier_uniform_(m.weight, .1)
            nn.init.constant_(m.bias, 0.)

    if pretrained:
        state_dict = torch.load("../alexnet_caffe.pth.tar")
        del state_dict["classifier.fc8.weight"]
        del state_dict["classifier.fc8.bias"]
        model.load_state_dict(state_dict, strict=False)
    return model


class DGcaffenet(nn.Module):
    def __init__(self, num_classes, num_domains, pretrained=True, grl=True):
        super(DGcaffenet, self).__init__()
        self.num_domains = num_domains
        self.base_model = caffenet(num_classes, pretrained=pretrained)
        self.discriminator = Discriminator(
            [4096, 1024, 1024, num_domains], grl=grl, reverse=True)

    # add random noise after domain features, d_f -> false: add adversarial noise just after features, d_f->true: add noise after domain features
    def forward(self, x, vat=False, d_f=False, d=None):
        if vat is False:
            x = self.base_model.features(x*57.6)
            x = x.view(x.size(0), 256 * 6 * 6)
            x = self.base_model.classifier(x)
            output_class = self.base_model.class_classifier(x)
            output_domain = self.discriminator(x)
            return output_class, output_domain
        else:
            if d_f is False:
                x = self.base_model.features(x*57.6)
                if d is None:
                    d = torch.randn_like(x)
                    d = static_get_normalized_vector(d)
                adv_x = (x + d).view(x.size(0), 256 * 6 * 6)
                x = x.view(x.size(0), 256 * 6 * 6)
                adv_x = self.base_model.classifier(adv_x)
                x = self.base_model.classifier(x)
                output_class = self.base_model.class_classifier(adv_x)
                output_domain = self.discriminator(x)
                return output_class, output_domain, d
            else:
                x, d = self.vat_features(x, d=d)
                x = x.view(x.size(0), 256*6*6)
                x = self.base_model.classifier(x)
                output_class = self.base_model.class_classifier(x)
                output_domain = self.discriminator(x)
                return output_class, output_domain, d

    def vat_features(self, x, d=None):
        d = d
        for i, model in enumerate(self.base_model.features):
            if i == 0:
                x = model(x*57.6)
            else:
                x = model(x)
            if i == 5:
                x = model(x)
                if d is None:
                    d = torch.randn_like(x)
                    d = static_get_normalized_vector(d)
                x = x + d
        return x, d

    def features(self, x):
        x = self.base_model.features(x*57.6)
        x = x.view(x.size(0), 256 * 6 * 6)
        x = self.base_model.classifier(x)
        return x

    def conv_features(self, x):
        results = []
        for i, model in enumerate(self.base_model.features):
            if i == 0:
                x = model(x*57.6)
            else:
                x = model(x)
            if i in {5, 9}:
                results.append(x)
        return results

    def domain_features(self, x):
        for i, model in enumerate(self.base_model.features):
            if i == 0:
                x = model(x*57.6)
            else:
                x = model(x)
            if i == 5:
                x = model(x)
                break
        return x.view(x.size(0), -1)

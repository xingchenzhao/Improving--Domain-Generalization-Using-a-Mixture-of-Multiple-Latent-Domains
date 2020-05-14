import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np
import matplotlib.pyplot as plt


class ConditionalEntropyLoss(torch.nn.Module):
    def __init__(self):
        super(ConditionalEntropyLoss, self).__init__()

    def forward(self, x):
        b = F.softmax(x, dim=1) * F.log_softmax(x, dim=1)
        b = b.sum(dim=1)
        return -1.0 * b.mean(dim=0)


class VAT(nn.Module):
    def __init__(self, model, epoch, path):
        super(VAT, self).__init__()
        self.n_power = 1
        self.XI = 1e-6
        self.model = model
        self.epsilon = 70
        self.domain = False
        self.epoch = epoch
        self.epoch_var = None
        self.path = path

    def forward(self, X, logit, domain=False, epoch=None):
        self.domain = domain
        self.epoch_var = epoch
        vat_loss = self.virtual_adversarial_loss(X, logit)
        self.epoch = self.epoch+1
        return vat_loss

    def generate_virtual_adversarial_perturbation(self, x, logit):
        d = torch.randn_like(x)

        for _ in range(self.n_power):
            d = self.XI * self.get_normalized_vector(d).requires_grad_()
            if self.domain:
                _, logit_m = self.model(x + d)
            else:
                logit_m, _ = self.model(x + d)
            if self.epoch == self.epoch_var:
                x_d = (x+d).permute(0, 2, 3, 1).detach().cpu().numpy()
                x_d = (x_d - np.min(x_d))/np.ptp(x_d)
                plt.imshow(x_d[50, :, :, :])
                plt.savefig(
                    self.path+'x_d{:.4f}.jpg'.format(self.epoch_var))
            dist = self.kl_divergence_with_logit(logit, logit_m)
            grad = torch.autograd.grad(dist, [d])[0]
            d = grad.detach()

        return self.epsilon * self.get_normalized_vector(d)

    def kl_divergence_with_logit(self, q_logit, p_logit):
        q = F.softmax(q_logit, dim=1)
        qlogq = torch.mean(torch.sum(q * F.log_softmax(q_logit, dim=1), dim=1))
        qlogp = torch.mean(torch.sum(q * F.log_softmax(p_logit, dim=1), dim=1))
        return qlogq - qlogp

    def get_normalized_vector(self, d):
        return F.normalize(d.view(d.size(0), -1), p=2, dim=1).reshape(d.size())

    def virtual_adversarial_loss(self, x, logit):
        r_vadv = self.generate_virtual_adversarial_perturbation(x, logit)
        logit_p = logit.detach()
        if self.epoch == self.epoch_var:
            ori_x = x
            adv_x = x + r_vadv
            ori_x = ori_x.permute(0, 2, 3, 1).detach().cpu().numpy()
            adv_x = adv_x.permute(0, 2, 3, 1).detach().cpu().numpy()
            ori_x = (ori_x - np.min(ori_x))/np.ptp(ori_x)
            adv_x = (adv_x - np.min(adv_x))/np.ptp(adv_x)
            plt.imshow(ori_x[50, :, :, :])
            plt.savefig(
                self.path+'ori_x_{:.4f}.jpg'.format(self.epoch_var))
            plt.imshow(adv_x[50, :, :, :])
            plt.savefig(
                self.path+'adv_x{:.4f}.jpg'.format(self.epoch_var))

        if self.domain:
            _, logit_m = self.model(x + r_vadv)
        else:
            logit_m, _ = self.model(x + r_vadv)
        loss = self.kl_divergence_with_logit(logit_p, logit_m)
        return loss

import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np
import matplotlib.pyplot as plt


final_XI = 1e-6
final_epsilon = 3


class ConditionalEntropyLoss(torch.nn.Module):
    def __init__(self):
        super(ConditionalEntropyLoss, self).__init__()

    def forward(self, x):
        b = F.softmax(x, dim=1) * F.log_softmax(x, dim=1)
        b = b.sum(dim=1)
        return -1.0 * b.mean(dim=0)


class VAT(nn.Module):
    def __init__(self, model):
        super(VAT, self).__init__()
        self.n_power = 1
        self.XI = final_XI
        self.model = model
        self.epsilon = final_epsilon
        self.domain = False

    def forward(self, X, logit, domain=False):
        self.domain = domain
        vat_loss = self.virtual_adversarial_loss(X, logit)
        return vat_loss

    def generate_virtual_adversarial_perturbation(self, x, logit):
        # d = torch.randn_like(x)

        for _ in range(self.n_power):
            # d = self.XI * self.get_normalized_vector(d).requires_grad_()
            if self.domain:
                _, logit_m, d = self.model(x, vat=True)
            else:
                logit_m, _, d = self.model(x, vat=True)

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

        if self.domain:
            _, logit_m, _ = self.model(x, vat=True, d=r_vadv)
        else:
            logit_m, _, _ = self.model(x, vat=True, d=r_vadv)
        loss = self.kl_divergence_with_logit(logit_p, logit_m)
        return loss


def static_get_normalized_vector(d):
    d = final_XI * F.normalize(d.view(d.size(0), -1),
                               p=2, dim=1).reshape(d.size()).requires_grad_()
    return d

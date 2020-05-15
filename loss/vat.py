import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np
import matplotlib.pyplot as plt


final_XI = 1e-6


class ConditionalEntropyLoss(torch.nn.Module):
    def __init__(self):
        super(ConditionalEntropyLoss, self).__init__()

    def forward(self, x):
        b = F.softmax(x, dim=1) * F.log_softmax(x, dim=1)
        b = b.sum(dim=1)
        return -1.0 * b.mean(dim=0)


class VAT(nn.Module):
    def __init__(self, model, vat_eps):
        super(VAT, self).__init__()
        self.n_power = 1
        self.XI = 1e-6
        final_XI = self.XI
        self.model = model
        self.epsilon = vat_eps
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
                _, logit_m, d = self.model(x, vat=True, d_f=True)
            else:
                logit_m, _, d = self.model(x, vat=True, d_f=True)

            dist = self.kl_divergence_with_logit(logit, logit_m)
            try:
                grad = torch.autograd.grad(dist, [d])[0]
                d = grad.detach()
                return self.epsilon * self.get_normalized_vector(d)
            except:
                print(
                    'RuntimeError: CUDA error: an illegal memory access was encountered')
                return None

    def kl_divergence_with_logit(self, q_logit, p_logit):
        q = F.softmax(q_logit, dim=1)
        qlogq = torch.mean(torch.sum(q * F.log_softmax(q_logit, dim=1), dim=1))
        qlogp = torch.mean(torch.sum(q * F.log_softmax(p_logit, dim=1), dim=1))
        return qlogq - qlogp

    def get_normalized_vector(self, d):
        return F.normalize(d.view(d.size(0), -1), p=2, dim=1).reshape(d.size())

    def virtual_adversarial_loss(self, x, logit):
        r_vadv = self.generate_virtual_adversarial_perturbation(x, logit)
        if r_vadv is not None:
            logit_p = logit.detach()

            if self.domain:
                _, logit_m, _ = self.model(x, vat=True, d=r_vadv, d_f=True)
            else:
                logit_m, _, _ = self.model(x, vat=True, d=r_vadv, d_f=True)
            loss = self.kl_divergence_with_logit(logit_p, logit_m)
            return loss
        else:
            return 0


def static_get_normalized_vector(d):
    d = final_XI * F.normalize(d.view(d.size(0), -1),
                               p=2, dim=1).reshape(d.size()).requires_grad_()
    return d

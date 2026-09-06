# AI tooling detection: PyTorch
def vuln():
    # ruleid: detect-pytorch
    import torch
    # ruleid: detect-pytorch
    x = torch.tensor([1, 2, 3])
    # ruleid: detect-pytorch
    torch.save(x, "model.pt")


def safe():
    # ok: detect-pytorch
    import os
    # ok: detect-pytorch
    import numpy
    # ok: detect-pytorch
    data = [1, 2, 3]

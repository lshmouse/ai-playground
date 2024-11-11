#! /usr/bin/env python3

import torch
from torch import _dynamo as torchdynamo
from typing import List


@torch.compile
def toy_example(a, b):
    x = a / (torch.abs(a) + 1)
    if b.sum() < 0:
        b = b * -1
    return x * b


def main():
    for _ in range(100):
        toy_example(torch.randn(10), torch.randn(10))


if __name__ == "__main__":
    import depyf

    with depyf.prepare_debug("depyf_debug_dir"):
        main()

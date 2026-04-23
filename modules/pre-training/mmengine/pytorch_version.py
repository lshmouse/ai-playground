import torch

print('torch version: ', torch.__version__)
print('torch.distributed.is_available: ', torch.distributed.is_available())
print('torch.version.cuda: ', torch.version.cuda)
print('torch.backends.cudnn.version: ', torch.backends.cudnn.version())

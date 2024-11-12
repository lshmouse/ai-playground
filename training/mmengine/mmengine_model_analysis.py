import torch.nn.functional as F
import torchvision
from mmengine.model import BaseModel


class MMResNet50(BaseModel):

    def __init__(self):
        super().__init__()
        self.resnet = torchvision.models.resnet50()

    def forward(self, imgs, labels=None, mode='tensor'):
        x = self.resnet(imgs)
        if mode == 'loss':
            return {'loss': F.cross_entropy(x, labels)}
        elif mode == 'predict':
            return x, labels
        elif mode == 'tensor':
            return x


from mmengine.analysis import get_model_complexity_info

input_shape = (3, 224, 224)
model = MMResNet50()
analysis_results = get_model_complexity_info(model, input_shape)
# print(analysis_results['out_table'])
# print(analysis_results['out_arch'])
print("Model Flops:{}".format(analysis_results['flops_str']))
print("Model Parameters:{}".format(analysis_results['params_str']))

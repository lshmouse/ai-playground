''''
This is a simple example of a Python class with a __call__ method.
See: https://github.com/pytorch/pytorch/blob/main/torch/nn/modules/module.py

'''

class Model:
    def __init__(self, name):
        self.name = name

    def __call__(self, x):
        return "__call__ " + self.name + " " + str(x)

model = Model("demo")
print(model(10))
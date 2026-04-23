## Training

### mmengine
https://mmengine.readthedocs.io/zh-cn/latest

#### Distributed Training
eg:
```
torchrun --nnodes=2 --node_rank=0 --master_addr 127.0.0.1 --master_port 29500 --nproc_per_node=1 mmengine_dist_demo.py --launcher pytorch
torchrun --nnodes=2 --node_rank=1 --master_addr 127.0.0.1 --master_port 29500 --nproc_per_node=1 mmengine_dist_demo.py --launcher pytorch
```
#### Profiler

#### Tensorboard
Runnerç
```
visualizer=dict(type='Visualizer', vis_backends=[dict(type='TensorboardVisBackend')])
```

```
tensorboard --logdir work_dir
```

### References
- https://mmengine.readthedocs.io/zh-cn/latest/

## vLLM

### Setup
```
pip install vllm
```

### Example
local
```
python vllm_local.py
```
Ray cluster
```
ray init
python vllm_on_ray.py
```
Test:
```
curl http://localhost:8000/inference?query="Who%20are%20you"
```

### TODO
- deploy vllm on k8s with helm chart
- vllm on remote ray cluster
- ray cluster internals

### References
- https://zhuanlan.zhihu.com/p/710614883
- https://docs.ray.io/en/latest/serve/tutorials/vllm-example.html
- https://docs.vllm.ai/en/latest/
- https://github.com/vllm-project/vllm/issues/1363
- http://kubeagi.k8s.com.cn/docs/Concepts/models
- https://github.com/skypilot-org/skypilot

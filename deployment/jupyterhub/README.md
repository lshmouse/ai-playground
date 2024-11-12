## jupyterhub

### Install
```
helm pull --untar jupyterhub --repo https://jupyterhub.github.io/helm-chart/
helm upgrade -i --create-namespace jupyterhub  --namespace jupyterhub jupyterhub -f values.yaml

```
### Test
```
https://jupyterhub.ingress.k8s.cn/

```

### Build
Build jypyter notebook docker image with pytorch and gpu support
```
docker build -t oss/jupyter-notebook:pytorch-1.8.1-cuda11.1 . -f notebook.dockerfiles
docker run --gpus all --net=host --ipc=host -v /home/${USER}/workspace/:/app oss/jupyter-notebook:pytorch-1.8.1-cuda11.1
```

### TODO

### References
- https://zero-to-jupyterhub.readthedocs.io/en/latest/jupyterhub/installation.html

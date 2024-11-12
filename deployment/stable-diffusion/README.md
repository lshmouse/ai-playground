## stable-diffusion

### Install
```
helm pull stable-diffusion --repo https://amithkk.github.io/stable-diffusion-k8s  --untar
helm upgrade -i --create-namespace -n aigc stable-diffusion stable-diffusion -f values.yaml
```

### Upgrade
```
helm diff  -n aigc stable-diffusion stable-diffusion -f values.yaml
```

### Uninstall
```
helm uninstall -n aigc stable-diffusion
```

### References
- https://github.com/amithkk/stable-diffusion-k8s
- https://github.com/CompVis/stable-diffusion

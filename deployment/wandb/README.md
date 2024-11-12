## Wandb
### Install
```
helm pull --untar wandb --repo https://wandb.github.io/helm-charts
helm upgrade -i --create-namespace wandb wandb --namespace wandb -f values.yaml
```

### Upgrade
```
helm diff -n wandb wandb wandb -f values.yaml
```

### TODO

### References
- https://github.com/wandb

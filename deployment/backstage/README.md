## backstage

### Deployment
```
helm pull --untar backstage --repo  https://backstage.github.io/charts
```

```
helm upgrade -i --create-namespace backstage backstage -f values.yaml --namespace backstage
```

### Upgrade
```
helm diff backstage backstage -f values.yaml --namespace backstage
```

### References
- https://github.com/backstage/charts

## Yunikorn
See: https://yunikorn.ingress.k8s.com/

### Install
```
helm pull --untar yunikorn --repo  https://apache.github.io/yunikorn-release --version=1.3.0
helm upgrade -i --create-namespace yunikorn yunikorn -f values.yaml -n yunikorn
```

### Upgrade
check diff
```
helm diff -n yunikorn yunikorn yunikorn -f values.yaml
```

### Uninstall
```
helm uninstall -n yunikorn yunikorn
```

### References
- https://yunikorn.apache.org/docs/

## mlflow

### Deployment
```
helm pull --untar mlflow --repo  https://community-charts.github.io/helm-charts
```

```
helm upgrade -i --create-namespace mlflow mlflow -f values.yaml --namespace mlflow
```

### Upgrade
```
helm diff mlflow mlflow -f values.yaml --namespace mlflow
```
### References
- https://mlflow.org/docs/latest/quickstart.html#viewing-the-tracking-ui
- https://zhuanlan.zhihu.com/p/527444716
- https://www.mlflow.org/docs/latest/quickstart.html

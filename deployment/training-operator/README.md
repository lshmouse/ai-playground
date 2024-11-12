## training-operator

## Install
```
helm pull training-operator --untar --repo https://cowboysysop.github.io/charts/
helm upgrade -i --create-namespace training-operator  --namespace training-operator training-operator -f values.yaml
```
## Test
```
kubectl apply -f pytorch-example.yaml
kubectl describe pytorchjobs.kubeflow.org -n training-operator
```
metrics
```
kubectl port-forward svc/training-operator-metrics 8080 -n training-operator
```
see: http://localhost:8080/metrics

## TODO
- 训练过程可视化

## Reference
- https://github.com/kubeflow/training-operator
- https://github.com/kubeflow/training-operator/tree/master/examples
- https://datawhalechina.github.io/thorough-pytorch/index.html

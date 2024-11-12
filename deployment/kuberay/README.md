## KubeRay

### Install
```
helm pull kuberay-operator --version 0.5.0 --repo https://ray-project.github.io/kuberay-helm/ --untar
helm pull ray-cluster --version 0.5.0 --repo https://ray-project.github.io/kuberay-helm/ --untar
```

```
helm upgrade -i --create-namespace -n kuberay-operator kuberay-operator kuberay-operator -f operator-values.yaml
helm upgrade -i --create-namespace -n kuberay-operator ray-cluster ray-cluster -f values.yaml

```
### Upgrade
```
helm diff -n kuberay-operator kuberay-operator kuberay-operator -f  operator-values.yaml
helm diff -n kuberay-operator ray-cluster ray-cluster -f  values.yaml
```

### Example
```
kubectl exec raycluster-heterogeneous-head-9t28q -- python /opt/sample_code.py

```
### Docs
- https://ray-project.github.io/kuberay/deploy/helm/
- https://docs.ray.io/en/latest/cluster/kubernetes/getting-started.html
- https://ray-project.github.io/kuberay/components/operator/

- https://scale-py.godaai.org/ch-ray-data/data-transform.html

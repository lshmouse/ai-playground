## ML Dev Docker

### Build
```
docker build . -f ml.dockerfiles -t registry.qcraftai.com/global/ml-dev-docker
```

### Run
```
docker run --runtime=nvidia -it registry.qcraftai.com/global/ml-dev-docker
```

```
nvcc -V
```

### References

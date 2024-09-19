## AI Playground for lshmouse

### Experiments

### Third parties

### Usage
Run cpplint
```
bazel test --config=cpplint //experimental/cpp_example/...
```

### TODO List

#### Env Preparation
- Init dev docker
- Init bazel and c++ toolchain
- Init common thirdparties like gtest, gflags, opencv and so on

#### AI Env
- Cuda and cuda rules(https://github.com/bazel-contrib/rules_cuda)
- pybind11 and examples
- NCCL and examples

#### AI Models
- Vision

#### AI Training
TODO

#### AI Inference
TODO

### References
- Thanks to jiaming: https://github.com/storypku
- https://github.com/ApolloAuto/apollo
- See: https://github.com/kriscfoster/multi-language-bazel-monorepo
- https://github.com/yechuan51/multi-language-bazel-monorepo

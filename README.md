## AI Playground

### Experiments
TODO

### Usage
Run cpplint
```
bazel test --config=cpplint //experimental/cpp_example/...
```
### TODO List
#### Env Preparation
- [TODO] Init dev docker
- [DONE] Init bazel and c++ toolchain
- [DONE] rule_python https://github.com/bazelbuild/rules_python
- [DONE] Init common thirdparties like gtest, gflags, opencv and so on
- [DONE] rule_go and exmples: https://github.com/bazelbuild/rules_go
- [TODO] bazoku https://github.com/salesforce/bazoku
- [TODO] rules_helm https://github.com/abrisco/rules_helm
- [TODO] rules_k8s https://github.com/bazelbuild/rules_k8s
- [TODO] rules_rust and examples: https://github.com/bazelbuild/rules_rust
- [TOOD] rules_proto and examples: https://github.com/bazelbuild/rules_proto

### Code Linters
- [TODO] python https://github.com/philipuvarov/bazel-ruff
- [TODO] cpp iwyu https://github.com/storypku/bazel_iwyu
- [TODO] cpp dwyu https://github.com/martis42/depend_on_what_you_use
- [TODO] cpp clang tidy https://github.com/erenon/bazel_clang_tidy
- [TODO] BUILD https://github.com/bazelbuild/buildtools/blob/main/buildifier/README.md

#### AI Env
- [TODO] Cuda and cuda rules(https://github.com/bazel-contrib/rules_cuda)
- [DONE] pybind11 and examples
- [TODO] NCCL and examples

#### Autonomous System
- [TODO] rules_ros and examples: https://github.com/ApexAI/rules_ros
- [TODO] nuscenes dataset and dataloader
- [TODO] rerun.io examplee
- [TODO] mcap example

#### AI Models
- [TODO] NLP(BERT, GPT, etc.)
- [TODO] Vision(DETR, DETR-3D, BevFormer, TrackerFormer, MapFormer, etc.)

#### AI Training
- [TODO] npl data preprocessing examples
- [TODO] GPT training examples with DP, PP and TP

#### AI Inference
- [TODO] ONNX and examples
- [TODO] vllm and examples
- [TODO] TensorRT and examples
- [TODO] triton exmaples: https://openai.com/index/triton/

### GPU Support
- [TODO] GPU mem test tools
- [TODO] nvcc network performance test tools
- [TODO] pytorch profiling tools

### References
- Thanks to jiaming: https://github.com/storypku
- https://github.com/ApolloAuto/apollo
- See: https://github.com/kriscfoster/multi-language-bazel-monorepo
- https://github.com/yechuan51/multi-language-bazel-monorepo
- See: https://github.com/aspect-build/bazel-examples/tree/main
- Linter: https://pigweed.dev/automated_analysis.html

load("@pip//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_binary(
    name = "vllm_batch",
    srcs = ["vllm_batch.py"],
    main = "vllm_batch.py",
    deps = [
        requirement("vllm"),
    ],
)

py_binary(
    name = "vllm_local",
    srcs = ["vllm_local.py"],
    main = "vllm_local.py",
    deps = [
        requirement("vllm"),
    ],
)

py_binary(
    name = "vllm_on_ray",
    srcs = ["vllm_on_ray.py"],
    main = "vllm_on_ray.py",
    deps = [
        requirement("vllm"),
        requirement("ray"),
        requirement("fastapi"),
    ],
)
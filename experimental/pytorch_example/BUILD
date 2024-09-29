load("@pip//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_binary(
    name = "pytorch_compile_demo",
    srcs = ["pytorch_compile_demo.py"],
    main = "pytorch_compile_demo.py",
    env = {
        "TORCH_COMPILE_DEBUG": "1",
    },
    deps = [
        requirement("typing_extensions"),
        requirement("depyf"),
    ],
)

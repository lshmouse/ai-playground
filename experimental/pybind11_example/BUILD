load("@pybind11_bazel//:build_defs.bzl", "pybind_extension")
load("@rules_python//python:defs.bzl", "py_library", "py_test")

pybind_extension(
    name = "example",
    srcs = ["example.cpp"],
)

py_library(
    name = "example_lib",
    data = [":example.so"],
    imports = ["."],
)

py_test(
    name = "example_test",
    srcs = ["example_test.py"],
    deps = [":example_lib"],
)

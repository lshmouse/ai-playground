load("@pip//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_binary(
    name = "ray_demo",
    srcs = ["ray_demo.py"],
    main = "ray_demo.py",
    deps = [
        requirement("ray"),
    ],
)
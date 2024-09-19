load("@pip//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_binary(
    name = "python_cli",
    srcs = ["python_cli.py"],
)

py_library(
    name = "python_web_lib",
    srcs = ["python_web.py"],
    deps = [
        requirement("Flask"),
    ],
)

py_binary(
    name = "python_web",
    srcs = ["python_web.py"],
    main = "python_web.py",
    deps = [":python_web_lib"],
)

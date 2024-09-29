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

py_binary(
    name = "python_decorator",
    srcs = ["python_decorator.py"],
    main = "python_decorator.py",
)

py_binary(
    name = "python_context_manager",
    srcs = ["python_context_manager.py"],
    main = "python_context_manager.py",
)

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

cc_library(
    name = "onnxruntime",
    visibility = ["//visibility:public"],
    deps = select({
        "@platforms//cpu:aarch64": ["@onnxruntime_aarch64//:onnxruntime"],
        "//conditions:default": ["@onnxruntime_x86_64//:onnxruntime"],
    }),
)

cc_binary(
    name = "onnxruntime_test",
    srcs = [
        "onnxruntime_test.cc",
    ],
    data = glob([
        "*.onnx",
    ]),
    deps = [
        ":onnxruntime",
    ],
)

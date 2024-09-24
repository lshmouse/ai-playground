load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

# Adapted from https://github.com/google/tink/blob/master/cc/third_party/rapidjson.BUILD.bazel

licenses(["notice"])  # MIT

cc_library(
    name = "rapidjson",
    hdrs = glob([
        "include/rapidjson/*.h",
        "include/rapidjson/**/*.h",
    ]),
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "tutorial_example",
    srcs = ["example/tutorial/tutorial.cpp"],
    deps = [
        ":rapidjson",
    ],
)

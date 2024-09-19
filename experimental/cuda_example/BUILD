load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("@rules_cuda//cuda:defs.bzl", "cuda_library")

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "cuda_example",
    srcs = [
        "cuda_example.cc",
    ],
    linkstatic = True,
    deps = [
        ":mat_add_lib",
        ":vector_add_lib",
        "@com_github_google_glog//:glog",
        "@com_google_absl//absl/strings",
    ],
)

cuda_library(
    name = "vector_add_lib",
    srcs = ["vector_add.cu"],
    hdrs = ["vector_add.h"],
    visibility = ["//visibility:private"],
    deps = [
        "@com_github_google_glog//:glog",
    ],
)

cuda_library(
    name = "mat_add_lib",
    srcs = ["mat_add.cu"],
    hdrs = ["mat_add.h"],
    visibility = ["//visibility:private"],
    deps = [
        "@com_github_google_glog//:glog",
    ],
)

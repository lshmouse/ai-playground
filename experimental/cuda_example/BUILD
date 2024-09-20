load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("@rules_cuda//cuda:defs.bzl", "cuda_library", "requires_cuda")

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "cuda_example",
    srcs = [
        "cuda_example.cc",
    ],
    linkstatic = True,
    defines = [] + select({
        "@rules_cuda//cuda:is_enabled": ["CUDA_ENABLED"],
        "//conditions:default": ["CUDA_DISABLED"],
    }),
    deps = [
        "@com_github_google_glog//:glog",
        "@com_google_absl//absl/strings",
    ] + select({
        "@rules_cuda//cuda:is_enabled": [":mat_add_lib", ":vector_add_lib"],
        "//conditions:default": [],
    }),
)

cuda_library(
    name = "vector_add_lib",
    srcs = ["vector_add.cu"],
    hdrs = ["vector_add.h"],
    visibility = ["//visibility:private"],
    deps = [
        "@com_github_google_glog//:glog",
    ],
    target_compatible_with = requires_cuda(),
)

cuda_library(
    name = "mat_add_lib",
    srcs = ["mat_add.cu"],
    hdrs = ["mat_add.h"],
    visibility = ["//visibility:private"],
    deps = [
        "@com_github_google_glog//:glog",
    ],
    target_compatible_with = requires_cuda(),
)

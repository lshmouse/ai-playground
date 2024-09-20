load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_cc//cc:defs.bzl", "cc_proto_library")
load("@rules_cc//cc:defs.bzl", "cc_binary")

package(default_visibility = ["//visibility:public"])

proto_library(
    name = "example_proto",
    srcs = ["example.proto"],
)

cc_proto_library(
    name = "example_cc_proto",
    deps = [":example_proto"],
)

cc_binary(
    name = "proto_example_main",
    srcs = ["proto_example_main.cc"],
    deps = [
        ":example_cc_proto",
        "@com_github_google_glog//:glog",
    ],
)
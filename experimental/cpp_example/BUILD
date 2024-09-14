load("//bazel/tools:cpplint.bzl", "cpplint")
load("@rules_cc//cc:defs.bzl", "cc_library", "cc_binary")
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "hello_greet",
    srcs = ["hello_greet.cc"],
    hdrs = ["hello_greet.h"],
)

cc_binary(
    name = "hello_world",
    srcs = ["hello_world.cc"],
    deps = [
        ":hello_greet",
    ],
)

cpplint()

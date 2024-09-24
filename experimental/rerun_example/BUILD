load("@rules_cc//cc:defs.bzl", "cc_binary")
package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "rerun_example",
    srcs = [
        "rerun_example.cpp",
    ],
    linkopts = ["-ldl"],
    tags = ["no-tidy"],
    deps = [
        "@com_github_google_glog//:glog",
        "@rerun",
    ],
)

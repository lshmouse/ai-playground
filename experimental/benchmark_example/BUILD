load("@rules_cc//cc:defs.bzl", "cc_binary")

package(
    default_visibility = ["//visibility:public"],
)

cc_binary(
    name = "string_bm",
    srcs = ["string_bm.cc"],
    linkopts = [
        "-lm",
        "-pthread",
    ],
    deps = [
        "@com_github_google_benchmark//:benchmark",
    ],
)

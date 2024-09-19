load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_library(
    name = "go_web_lib",
    srcs = ["main.go"],
    importpath = "github.com/lshmouse/ai-playground/experimental/go_example/go_web",
    visibility = ["//visibility:private"],
    deps = [
        "@com_github_gorilla_mux//:mux",
    ],
)

go_binary(
    name = "go_web",
    embed = [":go_web_lib"],
    visibility = ["//visibility:public"],
)
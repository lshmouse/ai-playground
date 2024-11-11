load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "aspect_rules_lint",
        sha256 = "7d5feef9ad85f0ba78cc5757a9478f8fa99c58a8cabc1660d610b291dc242e9b",
        strip_prefix = "rules_lint-1.0.2",
        url = "https://github.com/aspect-build/rules_lint/releases/download/v1.0.2/rules_lint-v1.0.2.tar.gz",
    )

    # aspect_rules_lint depends on aspect_bazel_lib.
    http_archive(
        name = "aspect_bazel_lib",
        sha256 = "6d758a8f646ecee7a3e294fbe4386daafbe0e5966723009c290d493f227c390b",
        strip_prefix = "bazel-lib-2.7.7",
        url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.7.7/bazel-lib-v2.7.7.tar.gz",
    )
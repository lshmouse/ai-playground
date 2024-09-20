"""Loads the rules_cuda library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "rules_cuda",
        sha256 = "c92b334d769a07cd991b7675b2f6076b8b95cd3b28b14268a2f379f8baae58e0",
        strip_prefix = "rules_cuda-v0.2.3",
        urls = ["https://github.com/bazel-contrib/rules_cuda/releases/download/v0.2.3/rules_cuda-v0.2.3.tar.gz"],
    )
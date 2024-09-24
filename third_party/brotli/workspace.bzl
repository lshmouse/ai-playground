"""Loads the brotli library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    http_archive(
        name = "brotli",
        build_file = "//third_party/brotli:brotli.BUILD",
        sha256 = "4c61bfb0faca87219ea587326c467b95acb25555b53d1a421ffa3c8a9296ee2c",
        strip_prefix = "brotli-1.0.7",
        urls = [
            "https://github.com/google/brotli/archive/v1.0.7.tar.gz",
        ],
    )

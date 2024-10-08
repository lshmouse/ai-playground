"""Loads the bazel_skylib library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "bazel_skylib",
        sha256 = "2e6fa9a61db799266072df115a719a14a9af0e8a630b1f770ef0bd757e68cd71",
        strip_prefix = "bazel-skylib-de3035d605b4c89a62d6da060188e4ab0c5034b9",
        urls = ["https://github.com/bazelbuild/bazel-skylib/archive/de3035d605b4c89a62d6da060188e4ab0c5034b9.tar.gz"],
    )
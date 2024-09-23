"""Loads the zlib library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "zstd",
        build_file = "//third_party/zstd:zstd.BUILD",
        sha256 = "a364f5162c7d1a455cc915e8e3cf5f4bd8b75d09bc0f53965b0c9ca1383c52c8",
        strip_prefix = "zstd-1.4.4",
        urls = [
            "https://github.com/facebook/zstd/archive/v1.4.4.tar.gz",
        ],
    )

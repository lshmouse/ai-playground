"""Loads the snappy library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Sanitize a dependency
def clean_dep(dep):
    return str(Label(dep))

def repo():
    http_archive(
        name = "snappy",
        build_file = "//third_party/snappy:snappy.BUILD",
        sha256 = "16b677f07832a612b0836178db7f374e414f94657c138e6993cbfc5dcc58651f",
        strip_prefix = "snappy-1.1.8",
        urls = [
            "https://github.com/google/snappy/archive/1.1.8.tar.gz",
        ],
    )

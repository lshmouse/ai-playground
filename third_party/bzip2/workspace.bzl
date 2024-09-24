"""Loads the bzip2 library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    http_archive(
        name = "bzip2",
        build_file = "//third_party/bzip2:bzip2.BUILD",
        sha256 = "db106b740252669664fd8f3a1c69fe7f689d5cd4b132f82ba82b9afba27627df",
        strip_prefix = "bzip2-bzip2-1.0.8",
        urls = [
            "https://gitlab.com/bzip2/bzip2/-/archive/bzip2-1.0.8/bzip2-bzip2-1.0.8.tar.gz",
        ],
    )

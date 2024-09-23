"""Loads the zlib library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    maybe(
        http_archive,
        name = "zlib",
        build_file = clean_dep("//:third_party/zlib/zlib.BUILD"),
        sha256 = "38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32",
        strip_prefix = "zlib-1.3.1",
        urls = [
            "https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.xz",
            "https://zlib.net/zlib-1.3.1.tar.xz",
        ],
    )

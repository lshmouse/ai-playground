"""Loads the zlib library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    http_archive(
        name = "xsimd",
        build_file = "//third_party/xsimd:xsimd.BUILD",
        sha256 = "21b4700e9ef70f6c9a86952047efd8272317df4e6fee35963de9394fd9c5677f",
        strip_prefix = "xsimd-8.0.1",
        urls = [
            "https://github.com/xtensor-stack/xsimd/archive/refs/tags/8.0.1.tar.gz",
        ],
    )
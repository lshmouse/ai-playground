"""Loads the zlib library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    http_archive(
        name = "xz",
        build_file = "//third_party/xz:xz.BUILD",
        sha256 = "0d2b89629f13dd1a0602810529327195eff5f62a0142ccd65b903bc16a4ac78a",
        strip_prefix = "xz-5.2.5",
        urls = [
            "https://github.com/xz-mirror/xz/archive/v5.2.5.tar.gz",
        ],
    )
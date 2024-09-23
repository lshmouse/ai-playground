"""Loads the boringssl library"""
"""Copied from https://github.com/google/boringssl/archive/da7997d97fa17f22cc3eb9c681c8494af7a98eef.tar.gz """
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    http_archive(
        name = "boringssl",
        sha256 = "542dd328952cea08785b58990b12e0832c49123807c8854e136136830c8b115c",
        strip_prefix = "boringssl-da7997d97fa17f22cc3eb9c681c8494af7a98eef",
        urls = [
            "https://github.com/google/boringssl/archive/da7997d97fa17f22cc3eb9c681c8494af7a98eef.tar.gz"
        ],
    )
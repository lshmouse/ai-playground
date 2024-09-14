"""Loads the absl library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    absl_version = "20230802.0"
    http_archive(
        name = "com_google_absl",
        sha256 = "59d2976af9d6ecf001a81a35749a6e551a335b949d34918cfade07737b9d93c5",
        strip_prefix = "abseil-cpp-{}".format(absl_version),
        urls = [
            "https://github.com/abseil/abseil-cpp/archive/refs/tags/{}.tar.gz".format(absl_version),
        ],
    )

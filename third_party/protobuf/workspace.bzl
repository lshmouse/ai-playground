"""Loads the protobuf library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    version = "3.19.4"
    http_archive(
        name = "com_google_protobuf",
        strip_prefix = "protobuf-{}".format(version),
        sha256 = "3bd7828aa5af4b13b99c191e8b1e884ebfa9ad371b0ce264605d347f135d2568",
        urls = [
            "https://github.com/protocolbuffers/protobuf/archive/v{}.tar.gz".format(version),
        ],
    )

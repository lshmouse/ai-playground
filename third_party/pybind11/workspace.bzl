"""Loads the pybind11 library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "pybind11_bazel",
        sha256 = "8f546c03bdd55d0e88cb491ddfbabe5aeb087f87de2fbf441391d70483affe39",
        strip_prefix = "pybind11_bazel-26973c0ff320cb4b39e45bc3e4297b82bc3a6c09",
        urls = [
            "https://github.com/pybind/pybind11_bazel/archive/26973c0ff320cb4b39e45bc3e4297b82bc3a6c09.tar.gz",
        ],
    )

    http_archive(
        name = "pybind11",
        build_file = "@pybind11_bazel//:pybind11.BUILD",
        sha256 = "6cd73b3d0bf3daf415b5f9b87ca8817cc2e2b64c275d65f9500250f9fee1677e",
        strip_prefix = "pybind11-2.7.0",
        urls = [
            "https://github.com/pybind/pybind11/archive/refs/tags/v2.7.0.tar.gz",
        ],
    )

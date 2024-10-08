"""Loads the grpc library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    version = "1.59.5"
    http_archive(
        name = "com_github_grpc_grpc",
        strip_prefix = "grpc-{}".format(version),
        sha256 = "ad295f118a84d87096fe3eb416ef446d75d44c988eadccebc650656eb9383b3d",
        urls = [
            "https://github.com/grpc/grpc/archive/v{}.tar.gz".format(version),
        ],
    )

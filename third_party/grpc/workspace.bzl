"""Loads the grpc library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    version = "1.45.2"
    http_archive(
        name = "com_github_grpc_grpc",
        strip_prefix = "grpc-{}".format(version),
        sha256 = "e18b16f7976aab9a36c14c38180f042bb0fd196b75c9fd6a20a2b5f934876ad6",
        urls = [
            "https://github.com/grpc/grpc/archive/v{}.tar.gz".format(version),
        ],
    )

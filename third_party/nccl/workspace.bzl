"""Loads the nccl library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    http_archive(
        name = "nccl",
        build_file = "//third_party/nccl:nccl.BUILD",
        sha256 = "83b299cfc2dfe63887dadf3590b3ac2b8b2fd68ec5515b6878774eda39a697d2",
        strip_prefix = "nccl-9814c75eea18fc7374cde884592233b6b7dc055b",
        urls = ["https://github.com/nvidia/nccl/archive/9814c75eea18fc7374cde884592233b6b7dc055b.tar.gz"],
    )

    http_archive(
        name = "nccl-tests",
        build_file = "//third_party/nccl:nccl-tests.BUILD",
        sha256 = "946adb84f63aec66aea7aab9739d41df81c24f783e85fba6328ba243cfc057e0",
        strip_prefix = "nccl-tests-1a5f551ffd6e3271982b03a9d5653a3f6ba545fa",
        urls = ["https://github.com/nvidia/nccl-tests/archive/1a5f551ffd6e3271982b03a9d5653a3f6ba545fa.tar.gz"],
    )
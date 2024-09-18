"""Loads Google Benchmark library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    version = "1.6.0"
    http_archive(
        name = "com_github_google_benchmark",
        sha256 = "1f71c72ce08d2c1310011ea6436b31e39ccab8c2db94186d26657d41747c85d6",
        strip_prefix = "benchmark-{}".format(version),
        urls = [
            "https://github.com/google/benchmark/archive/refs/tags/v{}.tar.gz".format(version),
        ]
    )
    # Direct link: https://github.com/google/benchmark/archive/refs/tags/v1.6.0.tar.gz"

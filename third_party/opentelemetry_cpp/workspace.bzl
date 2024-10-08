"""Loads the opentelemetry cpp library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    # 10.0.1
    version = "1.14.2"
    http_archive(
        name = "io_opentelemetry_cpp",
        strip_prefix = "opentelemetry-cpp-{}".format(version),
        sha256 = "c7e7801c9f6228751cdb9dd4724d0f04777ed53f524c8828e73bf4c9f894e0bd",
        urls = [
            "https://github.com/open-telemetry/opentelemetry-cpp/archive/refs/tags/v{}.tar.gz".format(version),
        ],
    )

"""Loads the googletest library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Original Link: https://github.com/google/googletest/archive/refs/tags/v1.14.0.tar.gz
def repo():
    version = "1.14.0"
    http_archive(
        name = "com_google_googletest",
        sha256 = "8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7",
        strip_prefix = "googletest-{}".format(version),
        urls = [
            "https://github.com/google/googletest/archive/refs/tags/v{}.tar.gz".format(version),
        ],
    )

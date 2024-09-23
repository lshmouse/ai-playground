"""Loads the double-conversion library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "double-conversion",
        sha256 = "8a79e87d02ce1333c9d6c5e47f452596442a343d8c3e9b234e8a62fce1b1d49c",
        strip_prefix = "double-conversion-3.1.6",
        urls = [
            "https://qcraft-web.oss-cn-beijing.aliyuncs.com/cache/packages/double-conversion-3.1.6.tar.gz",
            "https://github.com/google/double-conversion/archive/v3.1.6.tar.gz",
        ],
    )

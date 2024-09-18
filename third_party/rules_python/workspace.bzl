"""Loads the rules_python package"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    version = "0.8.1"
    http_archive(
        name = "rules_python",
        strip_prefix = "rules_python-{}".format(version),
        sha256 = "cdf6b84084aad8f10bf20b46b77cb48d83c319ebe6458a18e9d2cebf57807cdd",
        urls = [
            "https://github.com/bazelbuild/rules_python/archive/{}.tar.gz".format(version),
        ],
    )

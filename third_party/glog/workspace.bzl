"""Loads the glog library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    version = "0.5.0"
    http_archive(
        name = "com_github_google_glog",
        build_file = clean_dep("//third_party/glog:glog.BUILD"),
        strip_prefix = "glog-{}".format(version),
        sha256 = "eede71f28371bf39aa69b45de23b329d37214016e2055269b3b5e7cfd40b59f5",
        urls = [
            "https://github.com/google/glog/archive/v{}.tar.gz".format(version),
        ],
    )

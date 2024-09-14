"""Loads the glog library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    version = "1.6.1"
    http_archive(
        name = "cpplint",
        build_file = clean_dep("//third_party/cpplint:cpplint.BUILD"),
        sha256 = "7be47998c4bd590e229cf94f3312c46563d3ee35ea037b4ed389720f510029d6",
        strip_prefix = "cpplint-{}".format(version),
        urls = [
            "https://github.com/cpplint/cpplint/archive/{}.tar.gz".format(version),
        ],
    )

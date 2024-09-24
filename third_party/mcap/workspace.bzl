load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    mcap_version = "v1.2.0"
    http_archive(
        name = "mcap",
        build_file = "//third_party/mcap:mcap.BUILD",
        sha256 = "11a6badecac2b10e9687e912648a6e9679ef8731e4ab9570346ae9845ae64a65",
        strip_prefix = "mcap-releases-cpp-{}/cpp/mcap/include/".format(mcap_version),
        urls = [
            "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/{}/main.tar.gz".format(mcap_version),
        ],
    )

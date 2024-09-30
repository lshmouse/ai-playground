"""Loads the protobuf library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    version = "24.4"
    http_archive(
        name = "com_google_protobuf",
        strip_prefix = "protobuf-{}".format(version),
        sha256 = "616bb3536ac1fff3fb1a141450fa28b875e985712170ea7f1bfe5e5fc41e2cd8",
        urls = [
            "https://github.com/protocolbuffers/protobuf/releases/download/v{}/protobuf-{}.tar.gz".format(version, version),
        ],
    )

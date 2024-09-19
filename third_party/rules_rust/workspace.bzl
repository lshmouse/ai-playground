"""Loads the rules_proto library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    # To find additional information on this release or newer ones visit:
    # https://github.com/bazelbuild/rules_rust/releases
    http_archive(
        name = "rules_rust",
        integrity = "sha256-Weev1uz2QztBlDA88JX6A1N72SucD1V8lBsaliM0TTg=",
        urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.48.0/rules_rust-v0.48.0.tar.gz"],
    )
"""Loads the absl library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
   http_archive(
      name = "com_google_absl",
      urls = ["https://github.com/abseil/abseil-cpp/archive/273292d1cfc0a94a65082ee350509af1d113344d.zip"],
      strip_prefix = "abseil-cpp-273292d1cfc0a94a65082ee350509af1d113344d",
    )
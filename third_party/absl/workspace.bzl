"""Loads the absl library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
   http_archive(
      name = "com_google_absl",
      sha256 = "6764f226bd6e2d8ab9fe2f3cab5f45fb1a4a15c04b58b87ba7fa87456054f98b",
      strip_prefix = "abseil-cpp-273292d1cfc0a94a65082ee350509af1d113344d",
      urls = [
         "https://github.com/abseil/abseil-cpp/archive/273292d1cfc0a94a65082ee350509af1d113344d.zip"
      ],
    )
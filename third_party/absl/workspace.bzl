"""Loads the absl library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
   http_archive(
      name = "com_google_absl",
      sha256 = "f4871f2982e29496f4ddd598ccd5a87fea42f23c49b5e5eb459d57eab91df9d9",
      strip_prefix = "abseil-cpp-29bf8085f3bf17b84d30e34b3d7ff8248fda404e",
      urls = [
         "https://github.com/abseil/abseil-cpp/archive/29bf8085f3bf17b84d30e34b3d7ff8248fda404e.zip"
      ],
    )
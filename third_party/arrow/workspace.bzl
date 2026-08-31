"""Loads the arrow library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
   version = "10.0.1"
   http_archive(
      name = "arrow",
      build_file = "//third_party/arrow:arrow.BUILD",
      sha256 = "28c3e0402bc1c3c1e047b6e26cedb8d1d89b2b9497d576af24b0b700eef11701",
      strip_prefix = "arrow-apache-arrow-{}".format(version),
      urls = [
         "https://github.com/apache/arrow/archive/apache-arrow-{}.tar.gz".format(version),
      ],
   )
"""Loads the arrow library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
   http_archive(
      name = "arrow",
      build_file = "//third_party/arrow:arrow.BUILD",
      sha256 = "57e13c62f27b710e1de54fd30faed612aefa22aa41fa2c0c3bacd204dd18a8f3",
      strip_prefix = "arrow-apache-arrow-7.0.0",
      urls = [
         "https://github.com/apache/arrow/archive/apache-arrow-7.0.0.tar.gz",
      ],
   )
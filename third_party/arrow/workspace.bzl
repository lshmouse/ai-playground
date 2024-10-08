"""Loads the arrow library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
   http_archive(
      name = "arrow",
      build_file = "//third_party/arrow:arrow.BUILD",
      sha256 = "07cdb4da6795487c800526b2865c150ab7d80b8512a31793e6a7147c8ccd270f",
      strip_prefix = "arrow-apache-arrow-14.0.2",
      urls = [
         "https://github.com/apache/arrow/archive/apache-arrow-14.0.2.tar.gz",
      ],
   )
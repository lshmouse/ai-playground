load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    http_archive(
        name = "rerun",
        build_file = "//third_party/rerun:rerun.BUILD",
        sha256 = "5f38113a647c72255b902fc3e00ca090c8011821550c94554c8c3845d2eac2a3",
        strip_prefix = "rerun_cpp_sdk",
        url = "https://github.com/rerun-io/rerun/releases/download/0.13.0/rerun_cpp_sdk.zip",
    )

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    foxglove_version = "v1.1.2"
    http_archive(
        name = "foxglove_schemas",
        build_file = "//third_party/foxglove_schemas:foxglove_schemas.BUILD",
        sha256 = "73cbbfe59735da5874e3497259311789addcdab551d7deb6d5bd40619c854b8f",
        strip_prefix = "schemas-releases-typescript-{}/schemas/proto/".format(foxglove_version),
        urls = [
            "https://github.com/foxglove/schemas/archive/refs/tags/releases/typescript/{}.tar.gz".format(foxglove_version),
        ],
    )

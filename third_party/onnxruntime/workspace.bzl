load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    version = "1.11.0"

    http_archive(
        name = "onnxruntime_x86_64",
        build_file = clean_dep("//third_party/onnxruntime:onnxruntime.prebuilt.BUILD"),
        urls = [
            "https://github.com/microsoft/onnxruntime/releases/download/v{0}/onnxruntime-linux-x64-{0}.tgz".format(version),
        ],
        strip_prefix = "onnxruntime-linux-x64-{}".format(version),
        sha256 = "a5c2a6f1cfdc4a5b5e4257a66c7d3c659889686a35d4f351bdc2a3cdf9879c10",
    )

    http_archive(
        name = "onnxruntime_aarch64",
        build_file = clean_dep("//third_party/onnxruntime:onnxruntime.prebuilt.BUILD"),
        urls = [
            "https://github.com/microsoft/onnxruntime/releases/download/v{0}/onnxruntime-linux-aarch64-{0}.tgz".format(version),
        ],
        strip_prefix = "onnxruntime-linux-aarch64-{}".format(version),
        sha256 = "22e5f232580451e5bf9b614db8d8f02f8a0e5d920d82bbe7f7d8f9539aa5252c",
    )

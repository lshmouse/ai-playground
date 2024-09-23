load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    # Release from 2016-08-25; still the latest release on 2019-03-09
    version = "88bbd87ddd28f45a8b8a983365becfa923174783"
    http_archive(
        name = "rapidjson",
        urls = [
            "https://github.com/Tencent/rapidjson/archive/{}.tar.gz".format(version),
        ],
        sha256 = "136dc57ab2e73879351c7640b32e6d4fc5565131555b043e710f66c3c3003079",
        strip_prefix = "rapidjson-{}".format(version),
        build_file = clean_dep("//third_party/rapidjson:rapidjson.BUILD"),
    )

# Command to check if rapidjson.BUILD is OK:
# bazel run -c opt @rapidjson//:tutorial_example

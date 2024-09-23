load("//bazel/tools:cpplint.bzl", "cpplint")
load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
    name = "mcap_writer",
    srcs = ["mcap_writer.cpp"],
    deps = [
        "@com_github_gflags_gflags//:gflags",
        "@com_github_google_glog//:glog",
        "@com_google_absl//absl/status",
        "@mcap",
    ],
)

cc_binary(
    name = "foxglove_mcap_writer",
    srcs = ["foxglove_mcap_writer.cpp"],
    deps = [
        "@com_github_gflags_gflags//:gflags",
        "@com_github_google_glog//:glog",
        "@com_google_absl//absl/status",
        "@foxglove_schemas//:foxglove_schemas_cc_proto",
        "@mcap",
    ],
)

cc_binary(
    name = "foxglove_mcap_reader",
    srcs = ["foxglove_mcap_reader.cpp"],
    deps = [
        "@com_github_gflags_gflags//:gflags",
        "@com_github_google_glog//:glog",
        "@com_google_absl//absl/status",
        "@foxglove_schemas//:foxglove_schemas_cc_proto",
        "@mcap",
    ],
)

cpplint()

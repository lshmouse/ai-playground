load("@rules_cc//cc:defs.bzl", "cc_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")

package(default_visibility = ["//visibility:public"])

cc_proto_library(
    name = "foxglove_schemas_cc_proto",
    deps = [
        ":foxglove_schemas_proto",
    ],
)

proto_library(
    name = "foxglove_schemas_proto",
    srcs = glob(
        [
            "foxglove/*.proto",
        ],
    ),
    deps = [
        "@com_google_protobuf//:duration_proto",
        "@com_google_protobuf//:timestamp_proto",
    ],
)

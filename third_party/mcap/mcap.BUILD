load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "mcap",
    srcs = [
        "mcap/reader.inl",
        "mcap/types.inl",
        "mcap/writer.inl",
    ],
    hdrs = [
        "mcap/crc32.hpp",
        "mcap/errors.hpp",
        "mcap/internal.hpp",
        "mcap/intervaltree.hpp",
        "mcap/mcap.hpp",
        "mcap/read_job_queue.hpp",
        "mcap/reader.hpp",
        "mcap/types.hpp",
        "mcap/visibility.hpp",
        "mcap/writer.hpp",
    ],
    deps = [
        "@zstd",
        "@lz4",
    ],
)

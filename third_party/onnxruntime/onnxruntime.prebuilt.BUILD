load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "onnxruntime",
    srcs = glob([
        "lib/libonnxruntime.so",
        "lib/libonnxruntime.so.*",
    ]),
    hdrs = glob(
        [
            "include/*.h",
        ],
        exclude = [
            "include/cuda_provider_factory.h",
        ],
    ),
    include_prefix = "onnxruntime",
    strip_include_prefix = "include",
)

load("@rules_cc//cc:defs.bzl", "cc_import")
load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
)

cc_import(
    name = "rerun_core",
    static_library = "@rerun//:lib/librerun_c__linux_x64.a",
)

cc_library(
    name = "rerun",
    srcs = glob([
        "src/rerun/*.cpp",
        "src/rerun/**/*.cpp",
    ]),
    hdrs = glob([
        "src/rerun.hpp",
        "src/rerun/c/*.h",
        "src/rerun/*.hpp",
        "src/rerun/**/*.hpp",
    ]),
    includes = [
        "src",
    ],
    deps = [
        ":rerun_core",
        "@arrow",
    ],
)

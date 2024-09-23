load("@rules_cc//cc:defs.bzl", "cc_binary")
package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "demo",
    srcs = ["demo.c"],
    linkstatic = True,
    deps = [
        "@com_github_libevent_libevent//:libevent",
    ],
)

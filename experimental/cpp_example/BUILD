load("//bazel/tools:cpplint.bzl", "cpplint")
load("@rules_cc//cc:defs.bzl", "cc_library", "cc_binary")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_load", "oci_push")
load("@rules_pkg//pkg:tar.bzl", "pkg_tar")
package(default_visibility = ["//visibility:public"])


cc_library(
    name = "hello_greet",
    srcs = ["hello_greet.cc"],
    hdrs = ["hello_greet.h"],
)

cc_binary(
    name = "hello_world",
    srcs = ["hello_world.cc"],
    deps = [
        ":hello_greet",
    ],
)

# Packaging the binary into tar, which is needed by oci_image rule
pkg_tar(
    name = "hello_world_tar",
    srcs = [":hello_world"],
)

oci_image(
    name = "hello_world_image",
    base = "@debian_base",
    tars = [":hello_world_tar"],
    entrypoint = ["/hello_world"],
)

oci_load(
    name = "hello_world_image_load",
    image = ":hello_world_image",
    repo_tags = ["hello_world:latest"],
)

oci_push(
    name = "hello_world_image_push",
    image = ":hello_world_image",
    repository = "docker.io/ai-playground/hello_world",
    remote_tags = ["latest"]
)

cpplint()

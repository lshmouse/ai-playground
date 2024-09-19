# external dependencies that can be loaded in WORKSPACE files.

load("//third_party/toolchains_llvm:workspace.bzl", toolchains_llvm = "repo")
load("//third_party/bazel_gazelle:workspace.bzl", bazel_gazelle = "repo")
load("//third_party/rules_python:workspace.bzl", rules_python = "repo")
load("//third_party/rules_foreign_cc:workspace.bzl", rules_foreign_cc = "repo")
load("//third_party/pybind11:workspace.bzl", pybind11 = "repo")
load("//third_party/rules_proto:workspace.bzl", rules_proto = "repo")
load("//third_party/rules_go:workspace.bzl", rules_go = "repo")
load("//third_party/rules_rust:workspace.bzl", rules_rust = "repo")
load("//third_party/rules_cuda:workspace.bzl", rules_cuda = "repo")

load("//third_party/rules_oci:workspace.bzl", rules_oci = "repo")
load("//third_party/rules_pkg:workspace.bzl", rules_pkg = "repo")

load("//third_party/cpplint:workspace.bzl", cpplint = "repo")

load("//third_party/glog:workspace.bzl", glog = "repo")
load("//third_party/gflags:workspace.bzl", gflags = "repo")
load("//third_party/gtest:workspace.bzl", gtest = "repo")
load("//third_party/benchmark:workspace.bzl", benchmark = "repo")
load("//third_party/protobuf:workspace.bzl", protobuf = "repo")

load("//third_party/absl:workspace.bzl", absl = "repo")

def initialize_language_repos():
    toolchains_llvm()
    bazel_gazelle()

    rules_proto()
    rules_foreign_cc()
    rules_python()
    pybind11()
    rules_go()

    rules_pkg()
    rules_rust()
    rules_oci()
    rules_cuda()

def initialize_third_parties():
    """ Load third party repositories.  See above load() statements. """
    cpplint()

    glog()
    gflags()
    gtest()
    benchmark()
    protobuf()
    absl()

# Define all external repositories required by
def repositories():
    initialize_language_repos()
    initialize_third_parties()

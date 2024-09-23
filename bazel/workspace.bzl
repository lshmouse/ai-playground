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

# compression libraries
load("//third_party/boringssl:workspace.bzl", boringssl = "repo")
load("//third_party/brotli:workspace.bzl", brotli = "repo")
load("//third_party/zlib:workspace.bzl", zlib = "repo")
load("//third_party/lz4:workspace.bzl", lz4 = "repo")
load("//third_party/snappy:workspace.bzl", snappy = "repo")
load("//third_party/bzip2:workspace.bzl", bzip2 = "repo")
load("//third_party/zstd:workspace.bzl", zstd = "repo")
load("//third_party/xz:workspace.bzl", xz = "repo")

# third party libraries
load("//third_party/libevent:workspace.bzl", libevent = "repo")
load("//third_party/boost:workspace.bzl", boost = "repo")
load("//third_party/xsimd:workspace.bzl", xsimd = "repo")
load("//third_party/rapidjson:workspace.bzl", rapidjson = "repo")
load("//third_party/arrow:workspace.bzl", arrow = "repo")
load("//third_party/thrift:workspace.bzl", thrift = "repo")

# google cpp libraries
load("//third_party/double_conversion:workspace.bzl", double_conversion = "repo")
load("//third_party/absl:workspace.bzl", absl = "repo")
load("//third_party/glog:workspace.bzl", glog = "repo")
load("//third_party/gflags:workspace.bzl", gflags = "repo")
load("//third_party/gtest:workspace.bzl", gtest = "repo")
load("//third_party/benchmark:workspace.bzl", benchmark = "repo")
load("//third_party/protobuf:workspace.bzl", protobuf = "repo")
load("//third_party/grpc:workspace.bzl", grpc = "repo")

# autonomous vechicle libraries
load("//third_party/mcap:workspace.bzl", mcap = "repo")
load("//third_party/onnxruntime:workspace.bzl", onnxruntime = "repo")
load("//third_party/foxglove_schemas:workspace.bzl", foxglove_schemas = "repo")

def init_language_repos():
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

def init_compression_libs():
    boringssl()
    brotli()
    zlib()
    lz4()
    bzip2()
    snappy()
    zstd()
    xz()

def init_third_parties():
    """ Load third party repositories.  See above load() statements. """
    cpplint()


    xsimd()
    rapidjson()
    boost()
    arrow()
    libevent()
    thrift()

    double_conversion()
    absl()
    glog()
    gflags()
    gtest()
    benchmark()
    protobuf()
    grpc()

    mcap()
    foxglove_schemas()
    onnxruntime()

# Define all external repositories required by
def repositories():
    init_language_repos()
    init_compression_libs()
    init_third_parties()

# external dependencies that can be loaded in WORKSPACE files.
load("//third_party/rules_python:workspace.bzl", rules_python = "repo")
load("//third_party/rules_foreign_cc:workspace.bzl", rules_foreign_cc = "repo")
load("//third_party/pybind11:workspace.bzl", pybind11 = "repo")
load("//third_party/rules_proto:workspace.bzl", rules_proto = "repo")
load("//third_party/cpplint:workspace.bzl", cpplint = "repo")

def initialize_third_parties():
    """ Load third party repositories.  See above load() statements. """
    rules_python()
    rules_foreign_cc()
    rules_proto()
    cpplint()

# Define all external repositories required by
def repositories():
    initialize_third_parties()
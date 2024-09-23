"""Loads the rules_python package"""
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def clean_dep(dep):
    return str(Label(dep))

def repo():
    git_repository(
        name = "com_github_mvukov_rules_ros2",
        remote = "https://github.com/mvukov/rules_ros2.git",
        commit = "b599d6af09b90e0d548d3cb6e39fed8c3ef7be70",
    )

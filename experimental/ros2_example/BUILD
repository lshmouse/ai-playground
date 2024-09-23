load("@com_github_mvukov_rules_ros2//ros2:cc_defs.bzl", "ros2_cpp_binary")
load("@com_github_mvukov_rules_ros2//ros2:launch.bzl", "ros2_launch")

load("//bazel/tools:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

ros2_cpp_binary(
    name = "ros_talker",
    srcs = ["ros_talker.cc"],
    deps = [
        "@ros2_common_interfaces//:cpp_std_msgs",
        "@ros2_rclcpp//:rclcpp",
    ],
)

ros2_cpp_binary(
    name = "ros_listener",
    srcs = ["ros_listener.cc"],
    deps = [
        "@ros2_common_interfaces//:cpp_std_msgs",
        "@ros2_rclcpp//:rclcpp",
    ],
)

# Disabled ros2_launch temporarily, for following issue:
# Error: file '@rules_python//python:pip.bzl' does not contain symbol 'whl_filegroup'
#ros2_launch(
#    name = "ros_chatter",
#    launch_file = "ros_chatter.py",
#    nodes = [
#        ":ros_listener",
#        ":ros_talker",
#    ],
#)

cpplint()
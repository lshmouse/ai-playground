workspace(name = "ai_playground")

load("//bazel:workspace.bzl", "repositories")
repositories()

load("//bazel:init_deps.bzl", "init_deps")
init_deps()

# Load the LLVM toolchain
load("@toolchains_llvm//toolchain:deps.bzl", "bazel_toolchain_dependencies")
bazel_toolchain_dependencies()

load("@toolchains_llvm//toolchain:rules.bzl", "llvm_toolchain")
llvm_toolchain(
    name = "llvm_toolchain",
    llvm_version = "16.0.0",
)

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
rules_foreign_cc_dependencies()

load("@llvm_toolchain//:toolchains.bzl", "llvm_register_toolchains")
llvm_register_toolchains()

### Python Setup
load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

load("@rules_python//python:pip.bzl", "pip_install")

pip_install(
    name = "pip",
    requirements = "//bazel/python:requirements.txt",
)


### GRPC Setup
load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")
grpc_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")
grpc_extra_deps()

### Gazelle Setup
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

### Golang Setup
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
go_rules_dependencies()
# duplicate with grpc_extra_deps
# go_register_toolchains(version = "1.18")
gazelle_dependencies()

load("//bazel/go:deps.bzl", "go_dependencies")
go_dependencies()

### Rust Setup
load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")
rules_rust_dependencies()
rust_register_toolchains(
    versions=["1.78.0"],
    # Specifies the Rust edition to use for the registered toolchains
    edition = "2021",
)

### Docker Setup
load("@rules_oci//oci:dependencies.bzl", "rules_oci_dependencies")
rules_oci_dependencies()
load("@rules_oci//oci:repositories.bzl", "oci_register_toolchains")
oci_register_toolchains(name = "oci")

load("@rules_oci//oci:pull.bzl", "oci_pull")

oci_pull(
    name = "debian_base",
    digest = "sha256:3d868b5eb908155f3784317b3dda2941df87bbbbaa4608f84881de66d9bb297b",
    image = "debian",
    platforms = ["linux/amd64",],
)

### pybind11 Setup
load("@pybind11_bazel//:python_configure.bzl", "python_configure")
python_configure(name = "local_config_python")

### CUDA Setup
load("@rules_cuda//cuda:repositories.bzl", "register_detected_cuda_toolchains", "rules_cuda_dependencies")
rules_cuda_dependencies()
register_detected_cuda_toolchains()


### ROS2 Setup
load("@com_github_mvukov_rules_ros2//repositories:repositories.bzl", "ros2_repositories", "ros2_workspace_repositories")

ros2_workspace_repositories()

ros2_repositories()

load("@com_github_mvukov_rules_ros2//repositories:deps.bzl", "ros2_deps")

ros2_deps()

load("@rules_python//python:repositories.bzl", "python_register_toolchains")

python_register_toolchains(
    name = "rules_ros2_python",
    python_version = "3.10",
)

load("@rules_python//python:pip.bzl", "pip_parse")
load("@rules_ros2_python//:defs.bzl", python_interpreter_target = "interpreter")

pip_parse(
    name = "rules_ros2_pip_deps",
    python_interpreter_target = python_interpreter_target,
    requirements_lock = "@com_github_mvukov_rules_ros2//:requirements_lock.txt",
)

load(
    "@rules_ros2_pip_deps//:requirements.bzl",
    install_rules_ros2_pip_deps = "install_deps",
)

install_rules_ros2_pip_deps()


### OpenTelemetry Setup
load("@io_opentelemetry_cpp//bazel:repository.bzl", "opentelemetry_cpp_deps")
opentelemetry_cpp_deps()
# # (required after v1.8.0) Load extra dependencies required for OpenTelemetry
load("@io_opentelemetry_cpp//bazel:extra_deps.bzl", "opentelemetry_extra_deps")
opentelemetry_extra_deps()

load("@aspect_bazel_lib//lib:repositories.bzl", "aspect_bazel_lib_dependencies")

# aspect_bazel_lib depends on bazel_skylib
aspect_bazel_lib_dependencies()

load(
    "@aspect_rules_lint//format:repositories.bzl",
    # Fetch additional formatter binaries you need:
    "fetch_java_format",
    "fetch_ktfmt",
    "fetch_swiftformat",
    "rules_lint_dependencies",
)

rules_lint_dependencies()

fetch_java_format()

fetch_ktfmt()

fetch_swiftformat()

load("@aspect_rules_lint//lint:checkstyle.bzl", "fetch_checkstyle")

fetch_checkstyle()

load("@aspect_rules_lint//lint:pmd.bzl", "fetch_pmd")

fetch_pmd()

load("@aspect_rules_lint//lint:vale.bzl", "fetch_vale")

fetch_vale()

load("@aspect_rules_lint//lint:ktlint.bzl", "fetch_ktlint")

fetch_ktlint()

########################
# Optional: multitool provides defaults for some tools such as yamlfmt
# If you do not set up multitool, you must provide these tools yourself
load("@rules_multitool//multitool:multitool.bzl", "multitool")

multitool(
    name = "multitool",
    lockfiles = [
        "@aspect_rules_lint//format:multitool.lock.json",
        "@aspect_rules_lint//lint:multitool.lock.json",
    ],
)
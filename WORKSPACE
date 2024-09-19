workspace(name = "ai_playground")

load("//bazel:workspace.bzl", "repositories")
repositories()

# Load the LLVM toolchain
load("@toolchains_llvm//toolchain:deps.bzl", "bazel_toolchain_dependencies")
bazel_toolchain_dependencies()

load("@toolchains_llvm//toolchain:rules.bzl", "llvm_toolchain")
llvm_toolchain(
    name = "llvm_toolchain",
    llvm_version = "16.0.0",
)

load("@llvm_toolchain//:toolchains.bzl", "llvm_register_toolchains")
llvm_register_toolchains()

### Python Setup
load("@rules_python//python:pip.bzl", "pip_install")

pip_install(
    name = "pip",
    requirements = "//bazel/python:requirements.txt",
)

### Gazelle Setup
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")
### Golang Setup
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
go_rules_dependencies()
go_register_toolchains(version = "1.18")
gazelle_dependencies()

load("//bazel/go:deps.bzl", "go_dependencies")
go_dependencies()

### Rust Setup
load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")
rules_rust_dependencies()
rust_register_toolchains()

### Docker Setup
load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")
container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")
container_deps()
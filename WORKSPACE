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
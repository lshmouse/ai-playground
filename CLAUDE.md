# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Bazel-based multi-language monorepo for AI/ML and autonomous systems experimentation. Workspace name: `ai_playground`. Licensed under Apache 2.0.

Languages: C++17, Python, Go, Rust, CUDA, Protobuf. Key technologies include PyTorch, ROS2, gRPC, pybind11, OpenTelemetry, Apache Arrow, and MCAP.

## Build Commands

Bazel 6.2.1 (pinned in `.bazelversion`, use Bazelisk to manage).

```bash
# Build (CPU mode, excludes CUDA targets)
bazel build --config=cpu -- //...

# Build with GPU/CUDA support
bazel build --config=gpu -- //...

# C++ lint only
bazel test --config=cpplint //...

# Lint a specific package
bazel test --config=cpplint //experimental/cpp_example/...

# Unit tests (excludes cpplint)
bazel test --config=unit_test //...

# Full test suite (CPU mode)
bazel test --config=cpu -- //...

# Coverage (auto-excludes cpplint)
bazel coverage //...

# Run a single target
bazel run //experimental/cpp_example/hello_world:hello_world
bazel test //experimental/pybind11_example:example_test
```

CUDA compiler configs: `--config=cuda_clang` (clang) or `--config=cuda_nvcc` (nvcc).

User-local overrides go in `user.bazelrc` (git-ignored).

## Dev Environment

```bash
# Start dev Docker container (NVIDIA CUDA 12.2.2 + Ubuntu 22.04)
./playground.sh start_dev_docker

# Stop it
./playground.sh stop_dev_docker
```

## Repository Structure

- **`experimental/`** — Self-contained example projects (C++, Python, Go, Rust, CUDA, gRPC, ROS2, etc.), each with its own BUILD file
- **`third_party/`** — Bazel dependency declarations (`workspace.bzl` + BUILD per dep)
- **`bazel/`** — Workspace setup, toolchain configs, Python requirements, cpplint rules
- **`training/`** — mmengine-based distributed training examples
- **`deployment/`** — Helm values.yaml for Kubernetes services (MLflow, KubeRay, JupyterHub, W&B, etc.)
- **`modules/`** — Scaffolded but mostly empty (inferences, pre-training)
- **`dev/`** — Dev Docker image definition
- **`scripts/`** — Shell utility scripts

## CI Pipeline

GitHub Actions (`.github/workflows/ci.yaml`) runs on push/PR to `main`:
1. **shellcheck** — lints `.sh` files
2. **yamlfmt** — validates YAML formatting
3. **pyfmt** — auto-formats Python with autoyapf (PEP8 style), auto-commits fixes
4. **ci** — `bazel test --config=cpplint //...` then `bazel build --config=cpu -- //...` then `bazel test --config=cpu -- //...`

## Conventions

- C++ files must load cpplint in their BUILD file: `load("//tools:cpplint.bzl", "cpplint")` at top, `cpplint()` at bottom
- Python style: PEP8 enforced via autoyapf
- Commit messages follow: `[Category] Description (#PR)` where categories include `[Dev]`, `[AI]`, `[Demo]`
- LLVM/clang 16.0.0 toolchain for C++ builds

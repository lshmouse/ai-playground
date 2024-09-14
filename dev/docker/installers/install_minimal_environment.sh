#!/bin/bash

apt-get -y update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa

apt install -y bash \
    build-essential \
    git \
    git-lfs \
    curl \
    ca-certificates \
    libsndfile1-dev \
    libgl1 \
    python3.10 \
    python3-pip \
    python3.10-venv && \
    rm -rf /var/lib/apt/lists

# TODO: Install bazel

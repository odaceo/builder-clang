#!/bin/bash

# This install script is intended to install CLang.
#
# Environment variables:
# - LLVM_VERSION: the version to install

# Install add-apt-repository command
apt-get install software-properties-common

# Add LLVM Ubuntu repository
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
add-apt-repository -u 'http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main'

# Update your local package index
apt-get update

# Install CLang, LLDB & dependencies
apt-get install -y \
    clang-${LLVM_VERSION} \
    lldb-${LLVM_VERSION}

# Remove the local package index
rm -rf /var/lib/apt/lists/*

# Create symblic links
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${LLVM_VERSION} 100
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${LLVM_VERSION} 100
update-alternatives --install /usr/bin/cc cc /usr/bin/clang-${LLVM_VERSION} 100
update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-${LLVM_VERSION} 100
update-alternatives --install /usr/bin/cpp cpp /usr/bin/clang++-${LLVM_VERSION} 100

# Make sure clang is working properly
clang --version
clang++ --version

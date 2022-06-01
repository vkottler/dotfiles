#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

link_dep rust.sh

# load the updates
source ~/.bashrc

# add targets: https://doc.rust-lang.org/nightly/rustc/platform-support.html
# rustup target add thumbv6m-none-eabi
# rustup target add thumbv7m-none-eabi
# rustup target add thumbv7em-none-eabi
# rustup target add thumbv7em-none-eabihf

# add components
# rustup component add llvm-tools-preview
# cargo install cargo-binutils
# cargo install cargo-generate
# cargo install cargo-edit

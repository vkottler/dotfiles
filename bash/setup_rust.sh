#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source functions.sh
link_dep rust.sh

# load the updates
source ~/.bashrc

# add components
rustup component add llvm-tools-preview
rustup target add thumbv6m-none-eabi
rustup target add thumbv7m-none-eabi
rustup target add thumbv7em-none-eabi
rustup target add thumbv7em-none-eabihf
cargo install cargo-binutils
cargo install cargo-generate

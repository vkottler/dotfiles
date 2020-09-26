#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rm -f $HOME/.bash_includes/rust.sh
ln -s $(pwd)/bash_deps/rust.sh $HOME/.bash_includes/rust.sh

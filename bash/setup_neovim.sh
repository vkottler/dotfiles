#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup cmake
call_setup luarocks

PROJ=neovim

clone_third_party_github $PROJ $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

# See: https://github.com/neovim/neovim/wiki/Building-Neovim#third-party-dependencies
mkdir -p .deps
cd .deps
cmake $CMAKE_ARGS ../third-party/ -DUSE_BUNDLED=OFF
ninja
cd ..

mkdir -p build
cd build
cmake $CMAKE_ARGS ..
cd ..

popd >/dev/null

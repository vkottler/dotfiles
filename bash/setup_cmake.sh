#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_github Kitware CMake

pushd $THIRD_PARTY/CMake

# Build and install cmake.
./bootstrap --prefix=$THIRD_PARTY_PREFIX && make && make install

popd >/dev/null

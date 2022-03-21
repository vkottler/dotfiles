#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup cmake

clone_third_party_github DaveGamble cJSON

pushd $THIRD_PARTY/cJSON >/dev/null

# See: https://github.com/DaveGamble/cJSON#cmake
mkdir -p build
cd build
cmake $CMAKE_ARGS ..
ninja && ninja install

cd ..
popd >/dev/null

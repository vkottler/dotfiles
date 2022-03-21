#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_github Kitware CMake

pushd $THIRD_PARTY/CMake >/dev/null

ARGS="--parallel=`nproc`"
ARGS+=" --prefix=$THIRD_PARTY_PREFIX"

# Build docs with sphinx if its installed.
if command -v sphinx-build >/dev/null; then
	ARGS+=" --sphinx-man --sphinx-html --sphinx-info"
fi

# Use ninja if its installed.
if command -v ninja >/dev/null; then
	ARGS+=" --generator=Ninja"
fi

# Build and install cmake.
./bootstrap $ARGS
ninja && ninja install

popd >/dev/null

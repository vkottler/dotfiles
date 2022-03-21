#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup cmake

clone_third_party_github msgpack msgpack-c

pushd $THIRD_PARTY/msgpack-c >/dev/null

git checkout c_master
cmake $CMAKE_ARGS
ninja && ninja install

popd >/dev/null

#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup cmake
call_setup flex

PROJ=doxygen

clone_third_party_github $PROJ $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

# This doesn't work.

# See: https://www.doxygen.nl/manual/install.html#install_src_unix
mkdir -p build
cd build
cmake $CMAKE_ARGS ..
ninja && ninja install

popd >/dev/null

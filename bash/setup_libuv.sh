#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=libuv

clone_third_party_github $PROJ $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

# See: https://github.com/libuv/libuv#build-instructions
./autogen.sh
./configure $PREFIX_ARG
make
make check
make install

popd >/dev/null

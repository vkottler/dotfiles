#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_github universal-ctags ctags
pushd $THIRD_PARTY/ctags

# build and install
./autogen.sh
./configure --prefix=$THIRD_PARTY_PREFIX
make
make install

popd >/dev/null

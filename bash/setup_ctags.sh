#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

exit_if_command ctags

clone_third_party_github universal-ctags ctags
pushd $THIRD_PARTY/ctags >/dev/null

# build and install
./autogen.sh
./configure --prefix=$THIRD_PARTY_PREFIX
make
make install

popd >/dev/null

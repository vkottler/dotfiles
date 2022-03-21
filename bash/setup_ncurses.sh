#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_github mirror ncurses
pushd $THIRD_PARTY/ncurses >/dev/null

# Configure and install ncurses.
./configure --prefix=$THIRD_PARTY_PREFIX
make install

popd >/dev/null

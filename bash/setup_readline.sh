#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=readline

clone_third_party_gnu readline

pushd $THIRD_PARTY/$PROJ >/dev/null

./configure $PREFIX_ARG --with-curses
make -j
make install

popd >/dev/null

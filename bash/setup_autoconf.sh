#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=autoconf

clone_third_party_gnu $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

./bootstrap
./configure $PREFIX_ARG
make
make install

popd >/dev/null

#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=gperf

clone_third_party_gnu $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

./autopull.sh
./autogen.sh
./configure $PREFIX_ARG
make -j
make check
make install

popd >/dev/null

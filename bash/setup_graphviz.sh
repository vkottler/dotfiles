#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=graphviz

clone_third_party_https gitlab.com/$PROJ $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

./autogen.sh
./configure $PREFIX_ARG
make -j
make install

popd >/dev/null

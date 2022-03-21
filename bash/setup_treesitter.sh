#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=tree-sitter

clone_third_party_github $PROJ $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

make PREFIX="$CMAKE_INSTALL_PREFIX" install

popd >/dev/null

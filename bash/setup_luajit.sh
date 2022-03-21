#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=LuaJIT

clone_third_party_github $PROJ $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

# Use a release, or else it won't install on its own.
git checkout v2.0.5

make PREFIX="$CMAKE_INSTALL_PREFIX" install

popd >/dev/null

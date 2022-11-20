#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=node

exit_if_command $PROJ

clone_third_party_github nodejs $PROJ
pushd $THIRD_PARTY/$PROJ >/dev/null

./configure $PREFIX_ARG --ninja
make -j
make install

popd >/dev/null

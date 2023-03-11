#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
source "$REPO/bash/common.sh"

PROJ="ctags"

exit_if_command $PROJ

clone_third_party_github universal-$PROJ $PROJ
pushd "$THIRD_PARTY/$PROJ" >/dev/null

# build and install
./autogen.sh
./configure "$PREFIX_ARG"
make
make install

popd >/dev/null

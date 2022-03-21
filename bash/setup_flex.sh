#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup bison

PROJ=flex

exit_if_command $PROJ

clone_third_party_github westes $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

./autogen.sh
./configure $PREFIX_ARG
make && make install

popd >/dev/null

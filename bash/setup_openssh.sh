#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup openssl

PROJ=openssh

clone_third_party_github $PROJ $PROJ-portable

pushd $THIRD_PARTY/$PROJ-portable >/dev/null

autoreconf
./configure $PREFIX_ARG --with-ssl-dir=$LOCAL --with-ssl-engine
make -j && make tests
make install

popd >/dev/null

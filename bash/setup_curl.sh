#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=curl

clone_third_party_github $PROJ $PROJ
pushd $THIRD_PARTY/$PROJ >/dev/null

autoreconf -fi
./configure $PREFIX_ARG --with-openssl=$LOCAL
make -j && make test
make install

popd >/dev/null

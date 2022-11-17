#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=openssl

exit_if_command $PROJ

clone_third_party_github $PROJ $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

./Configure $PREFIX_ARG --openssldir=$HOME/.config/ssl
make -j
make test
make install

popd >/dev/null

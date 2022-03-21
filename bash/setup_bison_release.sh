#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PKG=bison
VERSION=3.8.2

exit_if_command $PKG

get_gnu_release $PKG $VERSION

pushd $THIRD_PARTY/$PKG-$VERSION >/dev/null

./configure $PREFIX_ARG
make && make install

popd >/dev/null

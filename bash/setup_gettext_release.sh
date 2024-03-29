#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

exit_if_command msgfmt

call_setup gnulib

PKG=gettext
VERSION=0.21
clone_third_party_gnu $PKG

get_gnu_release $PKG $VERSION

pushd $THIRD_PARTY/$PKG-$VERSION >/dev/null

./configure $PREFIX_ARG
make && make install

popd >/dev/null

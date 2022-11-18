#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=glibc
VERSION=2.28

URI_BASE=http://ftp.gnu.org/gnu/$PROJ
DIST=$PROJ-$VERSION
ARTIFACT=$DIST.tar.gz

pushd $THIRD_PARTY >/dev/null

if ! [ -f $ARTIFACT ]; then
	wget $URI_BASE/$ARTIFACT
fi

if ! [ -d $DIST ]; then
	tar xvf $ARTIFACT
fi

# It's recommended to build inside a separate directory.
mkdir -p build-$PROJ-$VERSION
pushd build-$PROJ-$VERSION >/dev/null

../$PROJ-$VERSION/configure $PREFIX_ARG
make -j
make check
make install

popd >/dev/null
popd >/dev/null

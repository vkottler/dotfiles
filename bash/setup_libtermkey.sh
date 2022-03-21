#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

pushd $THIRD_PARTY >/dev/null

PKG=libtermkey
VERSION=0.22

if [ ! -f $PKG-$VERSION.tar.gz ]; then
	wget http://www.leonerd.org.uk/code/$PKG/$PKG-$VERSION.tar.gz
fi
if [ ! -d $PKG-$VERSION ]; then
	tar xvf $PKG-$VERSION.tar.gz
fi

pushd $PKG-$VERSION >/dev/null
make PREFIX="$CMAKE_INSTALL_PREFIX" install
popd >/dev/null

popd >/dev/null


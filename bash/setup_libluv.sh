#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_github luvit luv

pushd $THIRD_PARTY/luv >/dev/null

make CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=$CMAKE_INSTALL_PREFIX" \
	BUILD_TYPE=Release \
	WITH_SHARED_LIBUV=ON \
	BUILD_SHARED_LIBS=ON \
	BUILD_STATIC_LIBS=ON
make CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=$CMAKE_INSTALL_PREFIX" install

# Link the library to the correct location.
pushd $LIB >/dev/null
if [ ! -L luv.so ]; then
	ln -s $LIB/lua/5.1/luv.so
fi
popd >/dev/null

# Link the header to the correct location(s).
pushd $INCLUDE >/dev/null
mkdir -p luv
if [ ! -L luv/luv.h ]; then
	ln -s $THIRD_PARTY/luv/src/luv.h luv/luv.h
fi
if [ ! -L luv.h ]; then
	ln -s $THIRD_PARTY/luv/src/luv.h
fi
popd >/dev/null

popd >/dev/null

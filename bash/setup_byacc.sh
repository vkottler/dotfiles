#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
source "$REPO/bash/common.sh"

PROJ="byacc"
BUILD=20230219

pushd "$THIRD_PARTY" >/dev/null

if [ ! -f $PROJ.tar.gz ]; then
	wget https://invisible-island.net/datafiles/release/$PROJ.tar.gz
fi

if [ ! -d $PROJ-$BUILD ]; then
	tar xvf $PROJ.tar.gz
fi

pushd $PROJ-$BUILD >/dev/null

./configure "$PREFIX_ARG"
make -j
make install

popd >/dev/null
popd >/dev/null

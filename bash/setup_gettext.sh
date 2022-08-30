#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup gnulib

PROJ=gettext

clone_third_party_gnu $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

# Can't get this to build because GNU projects are garbage.

# Use local gnulib so we don't clone another one.
if [ -d gnulib ] && [ ! -L gnulib ]; then
	rmdir gnulib
	ln -s ../gnulib
fi

./autogen.sh
./configure $PREFIX_ARG
make && make install

popd >/dev/null

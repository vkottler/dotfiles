#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=ninja

exit_if_command $PROJ

clone_third_party_github ninja-build $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

# Build and install ninja.
./configure.py --bootstrap

# Link documentation to the expected location.
if [ ! -L $THIRD_PARTY_PREFIX/doc/ninja ]; then
	ln -s $THIRD_PARTY/ninja/doc $THIRD_PARTY_PREFIX/doc/ninja
fi

# Link binary so its on the path.
if [ ! -L $THIRD_PARTY_PREFIX/bin/ninja ]; then
	ln -s $THIRD_PARTY/ninja/ninja $THIRD_PARTY_PREFIX/bin/ninja
fi

popd >/dev/null

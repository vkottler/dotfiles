#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
source "$REPO/bash/common.sh"

PROJ=ninja

exit_if_command $PROJ
call_setup python

clone_third_party_github $PROJ-build $PROJ

pushd "$THIRD_PARTY/$PROJ" >/dev/null || exit

# Build and install ninja.
./configure.py --bootstrap

# Link documentation to the expected location.
if [ ! -L "$THIRD_PARTY_PREFIX/doc/$PROJ" ]; then
	mkdir -p "$THIRD_PARTY_PREFIX/doc"
	ln -s "$THIRD_PARTY/$PROJ/doc" "$THIRD_PARTY_PREFIX/doc/$PROJ"
fi

# Link binary so its on the path.
if [ ! -L "$THIRD_PARTY_PREFIX/bin/$PROJ" ]; then
	ln -s "$THIRD_PARTY/$PROJ/$PROJ" "$THIRD_PARTY_PREFIX/bin/$PROJ"
fi

popd >/dev/null || exit

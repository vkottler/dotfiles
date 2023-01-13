#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
source "$REPO/bash/common.sh"

PROJ=openlibm

clone_third_party_github JuliaMath $PROJ
pushd "$THIRD_PARTY/$PROJ" >/dev/null

make prefix="$THIRD_PARTY_PREFIX" install

popd >/dev/null

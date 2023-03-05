#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
source "$REPO/bash/common.sh"

PROJECT=wget

clone_third_party_gnu $PROJECT

pushd "$THIRD_PARTY/$PROJECT" >/dev/null

# Not implemented yet.

popd >/dev/null

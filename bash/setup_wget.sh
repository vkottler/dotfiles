#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_gnu wget

pushd $THIRD_PARTY/wget >/dev/null

# Not implemented yet.

popd >/dev/null

#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=trove-classifiers

call_setup python

clone_third_party_github pypa $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

$HOME_PIP install build
$HOME_PYTHON -m build .

popd >/dev/null

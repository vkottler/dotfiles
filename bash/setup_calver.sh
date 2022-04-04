#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=calver

ensure_home_venv
clone_third_party_github di $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

$HOME_PIP install build
$HOME_PYTHON -m build .

popd >/dev/null

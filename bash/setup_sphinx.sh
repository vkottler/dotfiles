#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

exit_if_command sphinx-build

ensure_home_venv
clone_third_party_github sphinx-doc sphinx

pushd $THIRD_PARTY/sphinx >/dev/null

# Install editable in our home venv.
$HOME_PIP install -e .

popd >/dev/null
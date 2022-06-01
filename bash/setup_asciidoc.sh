#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJECT=asciidoc
exit_if_command $PROJECT

ensure_home_venv
clone_third_party_github $PROJECT-py $PROJECT-py

pushd $THIRD_PARTY/$PROJECT-py >/dev/null

# Install editable in our home venv.
$HOME_PIP install -e .

popd >/dev/null

#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

exit_if_command asciidoc

ensure_home_venv
clone_third_party_github asciidoc-py asciidoc-py

pushd $THIRD_PARTY/asciidoc-py >/dev/null

# Install editable in our home venv.
$HOME_PIP install -e .

popd >/dev/null

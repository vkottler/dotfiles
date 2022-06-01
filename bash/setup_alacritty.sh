#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJECT=alacritty
clone_third_party_github $PROJECT $PROJECT

pushd $THIRD_PARTY/$PROJECT >/dev/null

cargo build --release

popd >/dev/null

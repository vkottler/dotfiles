#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

exit_if_command alacritty
call_setup cmake

PROJECT=alacritty
clone_third_party_github $PROJECT $PROJECT

pushd $THIRD_PARTY/$PROJECT >/dev/null

cargo build --release

popd >/dev/null

ln -s $THIRD_PARTY/$PROJECT/target/release/alacritty $HOME/bin/alacritty

#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=trace-cmd

clone_kernel_repo utils/$PROJ $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

make prefix=$THIRD_PARTY_PREFIX -j
make prefix=$THIRD_PARTY_PREFIX -j gui
make prefix=$THIRD_PARTY_PREFIX install
make prefix=$THIRD_PARTY_PREFIX install_gui

popd >/dev/null

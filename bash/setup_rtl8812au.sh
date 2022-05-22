#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_github aircrack-ng rtl8812au

pushd $THIRD_PARTY/rtl8812au >/dev/null

sudo make dkms_install

popd >/dev/null

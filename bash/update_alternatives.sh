#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

CUSTOM_NVIM_PATH=$HOME/bin/nvim

if command -v update-alternatives >/dev/null; then
    set -u
    for ALIAS in ex vi view vim vimdiff; do
        sudo update-alternatives --install /usr/bin/$ALIAS $ALIAS "${CUSTOM_NVIM_PATH}" 110
    done
fi

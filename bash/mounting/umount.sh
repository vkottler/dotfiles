#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
CWD=$REPO/bash/mounting
source $CWD/common.sh

set -x

for SHARE in $SHARES
do
    sudo umount $NAS_DEST/$SHARE || true
    if [ -L $CWD/$SHARE ]; then
	    rm $CWD/$SHARE
    fi
done

if [ -L $CWD/mnt ]; then
    rm $CWD/mnt
fi

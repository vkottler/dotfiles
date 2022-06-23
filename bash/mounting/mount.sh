#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
CWD=$REPO/bash/mounting
source $CWD/common.sh

set -x

if ! [ -L $CWD/mnt ]; then
	ln -s $NAS_DEST $CWD/mnt
fi

for SHARE in $SHARES
do
    mkdir -p $NAS_DEST/$SHARE

    # Mount the share.
    sudo mount \
        -t cifs \
        -o username=nobody,password=,uid=1000,gid=1000 \
        //$NAS_HOST/$SHARE \
        $NAS_DEST/$SHARE

    # Link the file to the current directory.
    if ! [ -L $CWD/$SHARE ]; then
        ln -s $NAS_DEST/$SHARE $CWD/$SHARE
    fi
done

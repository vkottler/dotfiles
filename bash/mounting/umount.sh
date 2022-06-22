#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
source $REPO/bash/mounting/common.sh

set -x

for SHARE in $SHARES
do
    sudo umount $NAS_DEST/$SHARE
done

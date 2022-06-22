#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
source $REPO/bash/mounting/common.sh

set -x

for SHARE in $SHARES
do
    mkdir -p $NAS_DEST/$SHARE
    sudo mount \
        -t cifs \
        -o username=nobody,password=,uid=1000,gid=1000 \
        //$NAS_HOST/$SHARE \
        $NAS_DEST/$SHARE
done

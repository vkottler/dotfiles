#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
CWD=$REPO/bash/mounting
source $CWD/common.sh

set -x

sudo cp $CWD/smb.conf /etc/samba/

# Make sure the configuration is valid.
testparm -s

sudo systemctl restart smbd
sudo systemctl restart nmbd

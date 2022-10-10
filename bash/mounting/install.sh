#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
CWD=$REPO/bash/mounting
source $CWD/common.sh

sudo apt install -y smartmontools cifs-utils samba smbclient

# Add a 'nobody' user for samba.
sudo smbpasswd -a nobody

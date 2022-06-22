#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
source $REPO/bash/mounting/common.sh

set -x

# Make sure the configuration is valid.
testparm -s

sudo systemctl restart smbd
sudo systemctl restart nmbd

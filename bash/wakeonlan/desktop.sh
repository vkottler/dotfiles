#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
CWD=$SCRIPTS/wakeonlan
source $CWD/common.sh

wakeonlan 18:C0:4D:29:8E:0C

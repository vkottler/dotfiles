#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
CWD=$SCRIPTS/wakeonlan
source $CWD/common.sh

wakeonlan FC:34:97:11:6E:20

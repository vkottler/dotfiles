#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
CWD=$REPO/scripts/wakeonlan

if ! command -v wakeonlan; then
	sudo apt install wakeonlan
fi

wakeonlan 18:C0:4D:29:8E:0C

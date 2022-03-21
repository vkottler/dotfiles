#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

set -x

sudo apt install -y libtool-bin

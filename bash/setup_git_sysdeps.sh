#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

set -x

exit_if_command docbook2x-texi

sudo apt install -y docbook2x libcurl4-openssh-dev

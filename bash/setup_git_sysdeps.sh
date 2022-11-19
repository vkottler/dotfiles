#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

exit_if_command docbook2x-texi

# libcurl4-openssh-dev
sudo apt install -y docbook2x

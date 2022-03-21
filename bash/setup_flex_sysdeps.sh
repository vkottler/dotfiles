#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

set -x

sudo apt install -y autopoint

# Install bison from a package because its impossible to build
# (see setup_bison.sh).
sudo apt install -y bison
sudo apt install -y bison++

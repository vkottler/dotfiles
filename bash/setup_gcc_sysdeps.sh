#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

set -x

# This isn't complete.
sudo apt install -y libgmpv4-dev

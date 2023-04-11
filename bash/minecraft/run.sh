#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
CWD=$REPO/bash/minecraft
source $CWD/common.sh

set -x
java -Xmx1024M -Xms1024M -jar $SERVER nogui

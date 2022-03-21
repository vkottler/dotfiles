#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_gnu gnulib

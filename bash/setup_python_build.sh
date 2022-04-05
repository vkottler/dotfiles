#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=build

ensure_home_venv
clone_third_party_github pypa $PROJ

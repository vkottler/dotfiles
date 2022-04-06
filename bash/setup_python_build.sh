#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

ensure_home_venv

for PACKAGE in build wheel setuptools
do
	clone_third_party_github pypa $PACKAGE
done

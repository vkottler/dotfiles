#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup python

for PACKAGE in build wheel setuptools
do
	clone_third_party_github pypa $PACKAGE

	# Install the packages as editable.
	pushd $THIRD_PARTY/$PACKAGE >/dev/null
	$HOME_PIP install -e .
	popd >/dev/null
done

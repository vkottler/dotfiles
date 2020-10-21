#!/bin/bash

source functions.sh

# check that $1 is a git repository
test -d $1
SRC_PATH=$(readlink -m $1)
git -C $SRC_PATH rev-parse
GIT_ROOT=`git -C $1 rev-parse --show-toplevel`
if [ "$SRC_PATH" != "$GIT_ROOT" ]; then
	echo "'$SRC_PATH' must be a git-repository root, found: '$GIT_ROOT'"
	exit 1
fi

# check that $2 is reachable
attempt_ping $2

# make sure the destination is empty
if ssh $USER@$2 test -d $SRC_PATH; then
	echo "'$SRC_PATH' exists on '$2', exiting"
	exit 1
fi

# clone our checkout onto their machine
ssh $USER@$2 git clone $(hostname):$SRC_PATH $SRC_PATH

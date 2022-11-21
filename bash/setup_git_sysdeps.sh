#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

exit_if_command docbook2x-texi

if ! is_macos; then
	sudo apt install -y docbook2x libcurl4-openssh-dev
else
	echo "Install something to get command 'docbook2x-texi'."
	exit 1
fi

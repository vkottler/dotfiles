#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

exit_if_command shtool

if ! is_macos; then
	sudo apt install -y shtool libxml2-utils xsltproc docbook-xsl
else
	brew install shtool gnu-getpot
fi

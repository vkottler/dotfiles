#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

VERSION=1.15.2
FILE=go$VERSION.linux-amd64.tar.gz

if ! command -v go; then
	wget https://golang.org/dl/$FILE
	sudo tar -C /usr/local -xzf $FILE
	rm $FILE
else
	GO_LOC=`which go`
	echo "'go' already found at $GO_LOC"
fi

link_dep go.sh
source $HOME/.bashrc

# https://github.com/moovweb/gvm
if [ ! -d "$HOME/.gvm" ]; then
	bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
fi

# make sure things like GOROOT are set always
source $HOME/.bashrc
gvm use go$VERSION --default

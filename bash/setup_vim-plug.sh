#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_github junegunn vim-plug

VIM_AUTOLOAD=$HOME/.vim/autoload

mkdir -p $VIM_AUTOLOAD
pushd $VIM_AUTOLOAD >/dev/null

if ! [ -f plug.vim ]; then
	ln -s $THIRD_PARTY/vim-plug/plug.vim
fi

popd >/dev/null

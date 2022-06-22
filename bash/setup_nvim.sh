#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

set -x

# install neovim if necessary
if ! command -v nvim >/dev/null; then
	source update_nvim.sh
fi

# link standard vimrc
NVIM_CONFIG=$HOME/.config/nvim
mkdir -p $NVIM_CONFIG
pushd $NVIM_CONFIG >/dev/null

if ! [ -L init.vim ]; then
    ln -s $REPO/init.vim
fi

popd >/dev/null

# make it the default
$(pwd)/update_alternatives.sh

# load the updates
source ~/.bashrc

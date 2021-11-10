#!/bin/bash

source bin/functions.sh
set -x

# install neovim if necessary
if ! command -v nvim >/dev/null; then
	source update_nvim.sh
fi

# link standard vimrc
mkdir -p ~/.config/nvim
ln -fs $(pwd)/../init.vim ~/.config/nvim/

# make it the default
$(pwd)/update_alternatives.sh

# install plugin manager
PLUG_FILE=${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim
rm -rf $PLUG_FILE
curl --create-dirs -fLo $PLUG_FILE https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim backwards compatability
mkdir -p $HOME/.vim/autoload
ln -fs $PLUG_FILE $HOME/.vim/autoload/plug.vim

# load the updates
source ~/.bashrc

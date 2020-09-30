#!/bin/bash

source functions.sh

APP_IMAGE=nvim.appimage

# download the app image
wget https://github.com/neovim/neovim/releases/download/nightly/$APP_IMAGE \
	-O $HOME_BIN/$APP_IMAGE
chmod u+x $HOME_BIN/$APP_IMAGE

# extract and symbolic links
$HOME_BIN/$APP_IMAGE --appimage-extract
rm -rf $HOME_BIN/_nvim
mv -f $(pwd)/squashfs-root $HOME_BIN/_nvim

ln -fs $HOME_BIN/_nvim/AppRun $HOME_BIN/neovim
ln -fs $HOME_BIN/neovim $HOME_BIN/nvim
rm -f $HOME_BIN/$APP_IMAGE

# link standard vimrc
mkdir -p ~/.config/nvim
ln -fs $(pwd)/init.vim ~/.config/nvim/

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

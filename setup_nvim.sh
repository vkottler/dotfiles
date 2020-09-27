#!/bin/bash

APP_IMAGE=nvim.appimage
HOME_BIN=$HOME/bin
mkdir -p $HOME_BIN

# download the app image
wget https://github.com/neovim/neovim/releases/download/nightly/$APP_IMAGE -O $HOME_BIN/$APP_IMAGE

# make executable and add symbolic links 
chmod u+x $HOME_BIN/$APP_IMAGE
$HOME_BIN/$APP_IMAGE --appimage-extract
rm -rf $HOME_BIN/_nvim
mv $(pwd)/squashfs-root $HOME_BIN/
mv $HOME_BIN/squashfs-root $HOME_BIN/_nvim
rm $HOME_BIN/$APP_IMAGE

ln -fs $HOME_BIN/_nvim/AppRun $HOME_BIN/neovim
ln -fs $HOME_BIN/neovim $HOME_BIN/nvim

# link standard vimrc
mkdir -p ~/.config/nvim
ln -fs $(pwd)/init.vim ~/.config/nvim/

# make it the default
$(pwd)/update_alternatives.sh

# load the updates
source ~/.bashrc

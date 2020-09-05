#!/bin/bash

APP_IMAGE=nvim.appimage
HOME_BIN=$HOME/bin

# download the app image
mkdir -p ~/bin
wget https://github.com/neovim/neovim/releases/download/nightly/$APP_IMAGE -O $HOME_BIN/$APP_IMAGE

# make executable and add symbolic links 
chmod +x $HOME_BIN/$APP_IMAGE
ln -s $HOME_BIN/$APP_IMAGE $HOME_BIN/neovim
ln -s $HOME_BIN/neovim $HOME_BIN/nvim

# link standard vimrc
mkdir -p ~/.config/nvim
ln -s $(pwd)/init.vim ~/.config/nvim/

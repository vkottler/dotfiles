#!/bin/bash

HOME_BIN=$HOME/bin
APP_IMAGE=nvim.appimage

# always start fresh
rm -rf $HOME_BIN/_nvim $HOME_BIN/nvim $HOME_BIN/neovim

# download the app image
wget https://github.com/neovim/neovim/releases/download/nightly/$APP_IMAGE \
	-O $HOME_BIN/$APP_IMAGE
chmod u+x $HOME_BIN/$APP_IMAGE

# extract and symbolic links
$HOME_BIN/$APP_IMAGE --appimage-extract
mv -f $(pwd)/squashfs-root $HOME_BIN/_nvim

ln -fs $HOME_BIN/_nvim/AppRun $HOME_BIN/neovim
ln -fs $HOME_BIN/neovim $HOME_BIN/nvim
rm -f $HOME_BIN/$APP_IMAGE

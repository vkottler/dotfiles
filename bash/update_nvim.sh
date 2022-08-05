#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

HOME_BIN=$HOME/bin
REL_URI=https://github.com/neovim/neovim/releases/download/nightly

if ! is_macos; then
    APP_IMAGE=nvim.appimage

    # always start fresh
    rm -rf $HOME_BIN/_nvim $HOME_BIN/nvim $HOME_BIN/neovim

    # download the app image
    wget $REL_URI/$APP_IMAGE -O $HOME_BIN/$APP_IMAGE
    chmod u+x $HOME_BIN/$APP_IMAGE

    # extract and symbolic links
    $HOME_BIN/$APP_IMAGE --appimage-extract
    mv -f $(pwd)/squashfs-root $HOME_BIN/_nvim

    ln -fs $HOME_BIN/_nvim/AppRun $HOME_BIN/neovim
    ln -fs $HOME_BIN/neovim $HOME_BIN/nvim
    rm -f $HOME_BIN/$APP_IMAGE
else
    pushd $THIRD_PARTY >/dev/null

    ARTIFACT=nvim-macos
    TARBALL=$ARTIFACT.tar.gz

    rm -rf $ARTIFACT
    wget $REL_URI/$TARBALL -O $TARBALL
    xattr -c $TARBALL
    tar xzvf $TARBALL

    popd >/dev/null

    for ALIAS in vi vim nvim neovim; do
        rm -f $HOME_BIN/$ALIAS
        ln -s $THIRD_PARTY/$ARTIFACT/bin/nvim $HOME_BIN/$ALIAS
    done
fi

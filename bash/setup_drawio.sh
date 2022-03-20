#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

APP_VERSION=`get_latest_release "jgraph/drawio-desktop"`

# strip the 'v' in the tag
APP_VERSION=${APP_VERSION#?}

APP_IMAGE=draw.io-x86_64-$APP_VERSION.AppImage
APP_SLUG=drawio

# download the app image
wget https://github.com/jgraph/drawio-desktop/releases/download/v$APP_VERSION/$APP_IMAGE \
	-O $HOME_BIN/$APP_IMAGE
chmod u+x $HOME_BIN/$APP_IMAGE

# extract the app image
$HOME_BIN/$APP_IMAGE --appimage-extract
rm -rf $HOME_BIN/_$APP_SLUG
mv -f $(pwd)/squashfs-root $HOME_BIN/_$APP_SLUG

# create expected aliases
ln -fs $HOME_BIN/_$APP_SLUG/AppRun $HOME_BIN/$APP_SLUG
ln -fs $HOME_BIN/_$APP_SLUG/AppRun $HOME_BIN/draw
rm -f $HOME_BIN/$APP_IMAGE

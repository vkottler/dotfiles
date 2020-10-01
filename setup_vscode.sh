#!/bin/bash

source functions.sh

APP_VERSION=1.49.2
APP_IMAGE=VSCodium-$APP_VERSION-1600994273.glibc2.16-x86_64.AppImage

# download the app image
wget https://github.com/VSCodium/vscodium/releases/download/$APP_VERSION/$APP_IMAGE \
	-O $HOME_BIN/$APP_IMAGE
chmod u+x $HOME_BIN/$APP_IMAGE

# extract the app image
$HOME_BIN/$APP_IMAGE --appimage-extract
rm -rf $HOME_BIN/_codium
mv -f $(pwd)/squashfs-root $HOME_BIN/_codium

# create expected aliases
ln -fs $HOME_BIN/_codium/AppRun $HOME_BIN/codium
ln -fs $HOME_BIN/_codium/AppRun $HOME_BIN/code
rm -f $HOME_BIN/$APP_IMAGE

# install base extensions
$HOME_BIN/_codium/usr/share/codium/bin/codium --install-extension asvetliakov.vscode-neovim
$HOME_BIN/_codium/usr/share/codium/bin/codium --install-extension dunstontc.viml

# link settings file
ln -fs $(pwd)/vscode/settings.json $HOME/.config/VSCodium/User/settings.json

# install code server
#curl -fsSL https://code-server.dev/install.sh | sh
#sudo systemctl enable --now code-server@$USER

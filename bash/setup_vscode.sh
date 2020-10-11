#!/bin/bash

source functions.sh

snap install --classic codium

# install base extensions
codium --install-extension asvetliakov.vscode-neovim
codium --install-extension dunstontc.viml

# link settings file
ln -fs $(pwd)/../vscode/settings.json $HOME/.config/VSCodium/User/settings.json

# install code server
#curl -fsSL https://code-server.dev/install.sh | sh
#sudo systemctl enable --now code-server@$USER

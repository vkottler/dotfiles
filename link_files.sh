#!/bin/bash

source functions.sh

remove_and_link .vimrc
mkdir -p $HOME/.vim
rm -rf $HOME/.vim/$USER
ln -sf $(pwd)/vim $HOME/.vim/$USER

remove_and_link .tmux.conf

remove_and_link .bash_aliases
remove_and_link .bashrc

remove_and_link_dir bin
remove_and_link_dir .bash_includes

link_dep ubuntu_standard.sh
link_dep editor.sh

# load new configurations
source $HOME/.bashrc

# add wsl if it makes sense to
source_if_wsl link_deps/link_wsl.sh link_deps/link_not_wsl.sh

# ubuntu-specific operations
source_if_ubuntu link_deps/link_ubuntu.sh link_deps/noop.sh

# load new configurations
source $HOME/.bashrc

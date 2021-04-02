#!/bin/bash

source bin/functions.sh

git submodule update --init --recursive

remove_and_link .vimrc ..
mkdir -p $HOME/.vim
rm -rf $HOME/.vim/$USER
ln -sf $(pwd)/../vim $HOME/.vim/$USER
ln -sf $HOME/.vim/$USER $HOME/.vim/root

remove_and_link .tmux.conf ..

remove_and_link .bash_aliases .
remove_and_link .bashrc .

remove_and_link_dir bin
remove_and_link_dir .bash_includes

link_dep ubuntu_standard.sh
link_dep editor.sh
link_dep paths.sh

# load new configurations
source $HOME/.bashrc

LINK_DIR=links

# add wsl if it makes sense to
source_if_wsl $LINK_DIR/link_wsl.sh $LINK_DIR/link_not_wsl.sh

# ubuntu-specific operations
source_if_ubuntu $LINK_DIR/link_ubuntu.sh $LINK_DIR/noop.sh

# load new configurations
source $HOME/.bashrc

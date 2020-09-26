#!/bin/bash

source setup.sh

remove_and_link .vimrc
remove_and_link .vimrc-common

remove_and_link .tmux.conf

remove_and_link .bash_aliases
remove_and_link .bashrc

remove_and_link_dir bin
remove_and_link_dir .bash_includes

# add wsl if it makes sense to
if [[ `uname -r` == *"microsoft"*  ]]; then
	link_dep wsl.sh
fi

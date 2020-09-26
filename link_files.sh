#!/bin/bash

remove_and_link() {
	rm -f $HOME/$1
	mkdir -p $HOME/`dirname $1`
	ln -s $(pwd)/$1 $HOME/$1
}

remove_and_link_dir() {
	rm -f $HOME/$1
	ln -s $(pwd)/$1 $HOME/$1
}

remove_and_link .vimrc
remove_and_link .vimrc-common

remove_and_link .tmux.conf

remove_and_link .bash_aliases
remove_and_link .bashrc

remove_and_link_dir bin
remove_and_link_dir .bash_includes

# add wsl if it makes sense to
if [[ `uname -r` == *"microsoft"*  ]]; then
	rm -f $HOME/.bash_includes/wsl.sh
	ln -s $(pwd)/bash_deps/wsl.sh $HOME/.bash_includes/wsl.sh
fi

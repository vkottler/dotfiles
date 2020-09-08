#!/bin/bash

remove_and_link() {
	rm -f $HOME/$1
	mkdir -p $HOME/`dirname $1`
	ln -s $(pwd)/$1 $HOME/$1
}

remove_and_link .vimrc
remove_and_link .vimrc-common
remove_and_link .tmux.conf
remove_and_link bin/wsl_browser.sh

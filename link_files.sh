#!/bin/bash

source setup.sh

remove_and_link .vimrc
remove_and_link .vimrc-common

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
if [[ `uname -r` == *"microsoft"*  ]]; then
	link_dep wsl.sh

	# trying to start stuff automatically is incredibly jank in wsl
	sudo cp -f $(pwd)/00-wsl.conf /etc/sudoers.d/00-wsl
	cp -f $(pwd)/wsl.bat $APP_DATA/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/wsl.bat
fi

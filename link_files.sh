#!/bin/bash
rm -f ~/.vimrc
rm -f ~/.vimrc-common
rm -f ~/.tmux.conf
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.vimrc-common ~/.vimrc-common
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

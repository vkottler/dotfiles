#!/bin/bash
rm -f ~/.vimrc
rm -f ~/.tmux.conf
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf


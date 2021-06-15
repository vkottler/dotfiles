#!/bin/bash

source bin/functions.sh

git submodule update --init --recursive

remove_and_link .vimrc ..
mkdir -p $HOME/.vim
rm -rf $HOME/.vim/$USER
ln -sf $(pwd)/../vim $HOME/.vim/$USER
ln -sf $HOME/.vim/$USER $HOME/.vim/root

# load external syntax files
mkdir -p $HOME/.vim/syntax
pushd $HOME/.vim/syntax >/dev/null
test -f jinja.vim || wget https://www.vim.org/scripts/download_script.php?src_id=8666 -O jinja.vim
test -f j2.vim || ln -s jinja.vim j2.vim
test -f htmljinja.vim || wget https://www.vim.org/scripts/download_script.php?src_id=6961 -O htmljinja.vim
popd >/dev/null

remove_and_link .tmux.conf ..

remove_and_link .profile .
remove_and_link .bash_aliases .
remove_and_link .bashrc .
remove_and_link .gdbinit .

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

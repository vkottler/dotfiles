#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

# Add config.site for ./configure awareness of .local installs.
mkdir -p $THIRD_PARTY_PREFIX
if [ ! -L $THIRD_PARTY_PREFIX/share/config.site ]; then
	mkdir -p $THIRD_PARTY_PREFIX/share
	ln -s $SCRIPTS/config.site $THIRD_PARTY_PREFIX/share/config.site
fi

remove_and_link .vimrc ..
mkdir -p $HOME/.vim

if [ ! -L $HOME/.vim/$USER ]; then
	ln -s $(pwd)/../vim $HOME/.vim/$USER
fi
if [ ! -L $HOME/.vim/root ]; then
	ln -s $HOME/.vim/$USER $HOME/.vim/root
fi

# load external syntax files
mkdir -p $HOME/.vim/syntax
pushd $HOME/.vim/syntax >/dev/null

test -L jinja.vim || ln -s $REPO/third-party/vim/jinja.vim
test -L j2.vim || ln -s jinja.vim j2.vim
test -L htmljinja.vim || ln -s $REPO/third-party/vim/htmljinja.vim

popd >/dev/null

remove_and_link .tmux.conf ..

remove_and_link .profile .
remove_and_link .bash_aliases .
remove_and_link .bashrc .
remove_and_link .gdbinit .

# universal ctags needs to look in ~/.ctags.d/*.ctags
remove_and_link .ctags .
mkdir -p $HOME/.ctags.d
if [ ! -L $HOME/.ctags.d/dotfiles.ctags ]; then
	ln -s $(pwd)/.ctags $HOME/.ctags.d/dotfiles.ctags
fi

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

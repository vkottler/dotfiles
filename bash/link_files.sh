#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

# Add config.site for ./configure awareness of .local installs.
mkdir -p $THIRD_PARTY_PREFIX
if [ ! -L $THIRD_PARTY_PREFIX/share/config.site ]; then
	mkdir -p $THIRD_PARTY_PREFIX/share
	ln -s $SCRIPTS/config.site $THIRD_PARTY_PREFIX/share/config.site
fi

link_repo_rel_home_rel_check_work rust/config.toml .cargo/config.toml

link_repo_rel_home_rel alacritty.yml .config/alacritty/alacritty.yml

link_repo_rel_home_rel .vimrc .vimrc

mkdir -p $HOME/.vim

if [ ! -L $HOME/.vim/$USER ]; then
	ln -s $REPO/vim $HOME/.vim/$USER
fi
if [ ! -L $HOME/.vim/root ]; then
	ln -s $HOME/.vim/$USER $HOME/.vim/root
fi

# load external syntax files
mkdir -p $HOME/.vim/syntax
pushd $HOME/.vim/syntax >/dev/null

for SYNTAX_FILE in jinja.vim htmljinja.vim
do
	test -f $SYNTAX_FILE && rm $SYNTAX_FILE
	test -L $SYNTAX_FILE || ln -s $REPO/third-party/vim/$SYNTAX_FILE
done

test -L j2.vim || ln -s jinja.vim j2.vim

popd >/dev/null

link_repo_rel_home_rel .tmux.conf .tmux.conf

link_repo_rel_home_rel bash/.profile .profile
link_repo_rel_home_rel bash/.bash_aliases .bash_aliases
link_repo_rel_home_rel bash/.bashrc .bashrc
link_repo_rel_home_rel bash/.gdbinit .gdbinit

# universal ctags needs to look in ~/.ctags.d/*.ctags
link_repo_rel_home_rel bash/.ctags .ctags
mkdir -p $HOME/.ctags.d
if [ ! -L $HOME/.ctags.d/dotfiles.ctags ]; then
	ln -s $REPO/bash/.ctags $HOME/.ctags.d/dotfiles.ctags
fi

link_repo_rel_home_rel bash/bin bin
link_repo_rel_home_rel bash/.bash_includes .bash_includes

link_dep ubuntu_standard.sh
link_dep xdg.sh
link_dep editor.sh
link_dep paths.sh

# load new configurations
source $HOME/.bashrc

LINK_DIR=$REPO/bash/links

# add wsl if it makes sense to
source_if_wsl $LINK_DIR/link_wsl.sh $LINK_DIR/link_not_wsl.sh

# load new configurations
source $HOME/.bashrc

# ubuntu-specific operations
source_if_ubuntu $LINK_DIR/link_ubuntu.sh $LINK_DIR/noop.sh

# run certain setup scripts
call_setup vim-plug
call_setup git_creds

#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJECT=alacritty

exit_if_command $PROJECT
call_setup cmake

clone_third_party_github $PROJECT $PROJECT

# System dependencies.
if ! is_macos; then
    sudo apt-get install pkg-config \
        libfreetype6-dev \
        libfontconfig1-dev \
        libxcb-xfixes0-dev \
        libxkbcommon-dev
fi

pushd $THIRD_PARTY/$PROJECT >/dev/null

cargo build --release

popd >/dev/null

if [ ! -L $HOME/bin/$PROJECT ]; then
	ln -s \
		$THIRD_PARTY/$PROJECT/target/release/$PROJECT \
		$HOME/bin/$PROJECT

    if command -v update-alternatives >/dev/null; then
        sudo update-alternatives --install \
            /usr/bin/x-terminal-emulator \
            x-terminal-emulator $HOME/bin/$PROJECT 1

        # Choose whether or not to make '$PROJECT' the default.
        sudo update-alternatives --config x-terminal-emulator
    fi
fi

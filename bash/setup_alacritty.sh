#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

exit_if_command alacritty
call_setup cmake

PROJECT=alacritty
clone_third_party_github $PROJECT $PROJECT

pushd $THIRD_PARTY/$PROJECT >/dev/null

cargo build --release

popd >/dev/null

if [ ! -L $HOME/bin/alacritty ]; then
	ln -s \
		$THIRD_PARTY/$PROJECT/target/release/alacritty \
		$HOME/bin/alacritty

	sudo update-alternatives --install \
		/usr/bin/x-terminal-emulator \
		x-terminal-emulator $HOME/bin/alacritty 1

	# Choose whether or not to make alacritty the default.
	sudo update-alternatives --config x-terminal-emulator
fi

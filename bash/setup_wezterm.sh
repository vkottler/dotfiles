#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJECT=wezterm

exit_if_command $PROJECT

clone_third_party_github wez $PROJECT

pushd $THIRD_PARTY/$PROJECT >/dev/null

cargo build --release

popd >/dev/null

if [ ! -L $HOME/bin/$PROJECT ]; then
	ln -s \
		$THIRD_PARTY/$PROJECT/target/release/$PROJECT \
		$HOME/bin/$PROJECT

	sudo update-alternatives --install \
		/usr/bin/x-terminal-emulator \
		x-terminal-emulator $HOME/bin/$PROJECT 1

	# Choose whether or not to make '$PROJECT' the default.
	sudo update-alternatives --config x-terminal-emulator
fi

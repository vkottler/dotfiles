#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
source $REPO/bash/common.sh

PROJECT=shellcheck
exit_if_command $PROJECT

clone_third_party_github koalaman $PROJECT

if ! command -v cabal >/dev/null; then
	sudo apt-get install cabal-install -y
fi

pushd "$THIRD_PARTY/$PROJECT" >/dev/null || exit

cabal update
cabal install
ln -s "$HOME/.cabal/shellcheck" "$HOME/.local/shellcheck"

popd >/dev/null || exit

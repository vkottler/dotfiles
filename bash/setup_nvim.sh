#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
source "$REPO/bash/common.sh"

# install neovim if necessary
if ! command -v nvim >/dev/null; then
	source "$REPO/bash/update_nvim.sh"
fi

# make it the default
$REPO/bash/update_alternatives.sh

# load the updates
source "$HOME/.bashrc"

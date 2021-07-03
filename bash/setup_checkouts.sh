#!/bin/bash
set -e

CHECKOUT_DIR=$HOME/git
mkdir -p $CHECKOUT_DIR

declare -A checkouts
checkouts[workspace]="git@github.com:vkottler/workspace.git"
checkouts[resume]="git@github.com:vkottler/resume.git"

for checkout in "${!checkouts[@]}"; do
	if [ ! -d "$CHECKOUT_DIR/$checkout" ]; then
		git clone "${checkouts[$checkout]}" "$CHECKOUT_DIR/$checkout"
		cd "$CHECKOUT_DIR/$checkout" && git submodule update --init --recursive
	fi
done

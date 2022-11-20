#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup cmake

PROJ=libvterm

clone_third_party_github TragicWarrior $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

# Tell this thing to use ncurses.
cmake \
	-DCURSES_LIBRARY="$LOCAL/lib/libncursesw.so" \
	-DCURSES_INCLUDE_PATH="$LOCAL/include/ncursesw" \
	$CMAKE_ARGS
ninja && ninja install

popd >/dev/null

#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=ncurses

clone_third_party_github mirror $PROJ
pushd $THIRD_PARTY/$PROJ >/dev/null

# Configure and install ncurses.
# --enable-widec
./configure $PREFIX_ARG \
	--with-shared \
	--with-cxx-shared \
	--with-normal \
	--with-termlib
make PREFIX="$CMAKE_INSTALL_PREFIX" install

# Link ncurses version of common headers.
pushd $INCLUDE >/dev/null
for FILE in curses.h term.h
do
	if [ ! -L $FILE ]; then
		ln -s ncursesw/$FILE
	fi
done
popd >/dev/null

popd >/dev/null

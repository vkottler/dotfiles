#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=lua

exit_if_command $PROJ
exit_if_command luac

VERSION=5.4.4

pushd $THIRD_PARTY >/dev/null

if ! [ -L $PROJ ]; then
	# See: https://www.lua.org/download.html.
	curl -R -O http://www.lua.org/ftp/$PROJ-$VERSION.tar.gz
	tar zxf $PROJ-$VERSION.tar.gz
	rm $PROJ-$VERSION.tar.gz

	ln -s $PROJ-$VERSION $PROJ
fi

pushd $PROJ >/dev/null

make all test
make install INSTALL_TOP=$LOCAL

popd >/dev/null

popd >/dev/null

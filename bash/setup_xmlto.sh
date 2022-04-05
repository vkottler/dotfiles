#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=xmlto

exit_if_command $PROJ

call_setup xmlto_sysdeps
clone_third_party_https pagure.io $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

if ! [ -L shtool ]; then
	ln -s `which shtool`
fi

# Source repositories are sometimes missing a lot of things.
aclocal
autoconf
automake --add-missing

./configure $PREFIX_ARG
make
make check
make install

popd >/dev/null

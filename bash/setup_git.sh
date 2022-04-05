#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=git
VERSION=v2.35.1

call_setup asciidoc
call_setup xmlto
call_setup git_sysdeps

clone_third_party_github $PROJ $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

git checkout $VERSION

make configure
./configure $PREFIX_ARG

# Build and install git.
make -j all
make install

# Try to build and install documentation.
make -j doc info
make install-doc install-html install-info

popd >/dev/null

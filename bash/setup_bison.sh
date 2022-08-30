#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=bison

exit_if_command $PROJ

call_setup gnulib
clone_third_party_gnu $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

git submodule update --init --recursive

# This is just another garbage GNU project that can't build anymore.
# https://github.com/akimd/bison/issues/65

./bootstrap --skip-po --gnulib-srcdir=$THIRD_PARTY/gnulib
./configure $PREFIX_ARG
make && make install

popd >/dev/null

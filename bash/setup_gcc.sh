#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=gcc
VERSION=8.5.0

call_setup gnulib
clone_third_party_git gcc.gnu.org/git $PROJ

# Checkout a release tag and download library dependencies.
pushd $THIRD_PARTY/$PROJ >/dev/null
# git checkout releases/gcc-$VERSION
# ./contrib/download_prerequisites
popd >/dev/null

# See: https://gcc.gnu.org/install/configure.html
pushd $THIRD_PARTY >/dev/null

mkdir -p $PROJ-objdir
pushd $PROJ-objdir >/dev/null

./../$PROJ/configure $PREFIX_ARG
make

popd >/dev/null

popd >/dev/null


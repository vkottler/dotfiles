#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

clone_third_party_gnu texinfo

pushd $THIRD_PARTY/texinfo >/dev/null

# texinfo is unfortunately complete garbage and won't build on any commit hash
# that I tried. I spent a few hours trying to build it.

# Use a tagged version for now (master build was broken).
# git checkout texinfo-6.7

# ./autogen.sh
# ./configure --prefix=$THIRD_PARTY_PREFIX
# source $THIRD_PARTY_PREFIX/share/config.site && make
# make install

popd >/dev/null

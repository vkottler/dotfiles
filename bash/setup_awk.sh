#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

PROJ=awk

clone_third_party_github onetrueawk $PROJ

pushd $THIRD_PARTY/$PROJ >/dev/null

make -j
if ! [ -L $LOCAL/bin/awk ]; then
	ln -s $THIRD_PARTY/$PROJ/a.out $LOCAL/bin/awk
fi

popd >/dev/null

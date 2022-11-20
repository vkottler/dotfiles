
#!/bin/bash
#
REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

call_setup lua

PROJ=luarocks

exit_if_command $PROJ

VERSION=3.9.1

pushd $THIRD_PARTY >/dev/null

if ! [ -L $PROJ ]; then
	# See: https://luarocks.org/.
	wget https://luarocks.org/releases/$PROJ-$VERSION.tar.gz
	tar zxpf $PROJ-$VERSION.tar.gz
	rm $PROJ-$VERSION.tar.gz

	ln -s $PROJ-$VERSION $PROJ
fi

if ! command -v unzip; then
	sudo apt install unzip
fi

pushd $PROJ >/dev/null

./configure $PREFIX_ARG --lua-version=$LUA_VERSION
make && make install

popd >/dev/null

popd >/dev/null

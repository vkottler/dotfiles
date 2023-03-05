#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
source "$REPO/bash/common.sh"

exit_if_command gource
PROJECT=Gource

clone_third_party_github acaudwell $PROJECT

INSTALL_PACKAGES=0

if [ $INSTALL_PACKAGES -ne 0 ]; then
	sudo apt-get install -y \
		libsdl2-dev \
		libsdl2-image-dev \
		libpcre2-dev \
		libfreetype6-dev \
		libglew-dev \
		libglm-dev \
		libboost-filesystem-dev \
		libpng-dev
fi

pushd "$THIRD_PARTY/$PROJECT" >/dev/null || exit

./autogen.sh
./configure "$PREFIX_ARG"
make -j "$(nproc)"
make install

popd >/dev/null || exit

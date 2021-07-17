#!/bin/bash -e

# see https://docs.ctags.io/en/latest/autotools.html#gnu-linux-distributions
sudo apt install -y \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev

mkdir -p $HOME/third-party
pushd $HOME/third-party >/dev/null

git clone git@github.com:universal-ctags/ctags.git
pushd ctags

# build and install
./autogen.sh
./configure
make
sudo make install

popd >/dev/null
popd >/dev/null

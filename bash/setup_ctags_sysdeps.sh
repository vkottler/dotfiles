#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

set -x

# see https://docs.ctags.io/en/latest/autotools.html#gnu-linux-distributions
sudo apt install -y \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev

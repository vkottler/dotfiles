#!/bin/bash

set -e

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

ensure_home_venv

sudo apt-get install -y python3 python-is-python3 python3-pip python3-venv python-dev-is-python3
python -m pip install --upgrade vmklib 'python-language-server[all]'

# install useful packages
$HOME_VENV/bin/pip install --upgrade vmklib grip

link_dep grip.sh

# load the updates
source ~/.bashrc

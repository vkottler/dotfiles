#!/bin/bash

set -e

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

if [ -d $HOME/venv$PYTHON_VERSION ]; then
	echo "Python is setup, exiting early."
	exit 0
fi

sudo apt-get install -y python3 \
	python-is-python3 \
	python3-pip \
	python3-venv \
	python-dev-is-python3

python -m pip install wheel
python -m pip install --upgrade vmklib 'python-language-server[all]'

ensure_home_venv

# install useful packages
$HOME_VENV/bin/pip install --upgrade grip
link_dep grip.sh

# load the updates
source ~/.bashrc

#!/bin/bash

set -e

if [ -z "$PYTHON_VERSION" ]; then
	echo 'set $PYTHON_VERSION first'
	exit 1
fi

sudo apt-get install -y python3 python-is-python3 python3-pip python3-venv python-dev-is-python3
python -m pip install vmklib 'python-language-server[all]'

# create the standard venv if necessary
HOME_VENV=$HOME/venv$PYTHON_VERSION
if [ ! -d $HOME_VENV ]; then
	python -m venv $HOME_VENV
fi

# install useful packages
$HOME_VENV/bin/pip install --upgrade wheel vmklib grip

source functions.sh
link_dep grip.sh

# load the updates
source ~/.bashrc

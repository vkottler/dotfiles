#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

if [ -L $HOME/venv ]; then
	echo "Home virtual environment is setup, exiting early."
    exit 0
fi

set -x

ensure_home_venv

# Install useful packages.
$HOME_VENV/bin/pip install --upgrade \
    wheel \
    grip \
    vmklib \
    'python-language-server[all]' \
    pylint \
    flake8 \
    mypy \
    black \
    isort \
    pynvim \
    yamllint

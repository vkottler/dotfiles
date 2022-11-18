#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

if [ -d $HOME/venv$PYTHON_VERSION ]; then
	echo "Python is setup, exiting early."
	exit 0
fi

if ! is_macos; then
    sudo apt-get install -y python3 \
        python-is-python3 \
        python3-pip \
        python3-venv \
        python-dev-is-python3
fi

call_setup home_venv

# load the updates
link_dep grip.sh
source ~/.bashrc

#!/bin/bash

set -e

sudo apt-get install python3 python-is-python3 python3-pip python3-venv
python -m pip install vmklib 'python-language-server[all]'

# create the standard venv if necessary
if [ ! -d $HOME/venv$PYTHON_VERSION ]; then
	python -m venv $HOME/venv$PYTHON_VERSION
fi

#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

# python
sudo apt-get install -y python3 python3-pip python-is-python3
sudo -H python3 -m pip install --upgrade pip

sudo apt-get autoremove

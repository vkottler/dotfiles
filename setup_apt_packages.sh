#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

# try to disable tracker-miner, when it runs it rails the cpu
echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-extract.desktop /etc/xdg/autostart/tracker-miner-apps.desktop /etc/xdg/autostart/tracker-miner-fs.desktop /etc/xdg/autostart/tracker-miner-user-guides.desktop /etc/xdg/autostart/tracker-store.desktop > /dev/null

# python
sudo apt-get install -y python3 python3-pip python-is-python3
sudo -H python3 -m pip install --upgrade pip

# vim package manager and other installers
sudo apt-get install -y curl ack-grep

sudo apt-get autoremove

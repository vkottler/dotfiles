#!/bin/bash
set -e && set -x

# see https://certbot.eff.org/lets-encrypt/otherpip-other
sudo apt-get update && sudo apt-get install libaugeas0 -y
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot
sudo rm -f /usr/bin/certbot
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot

sudo certbot certonly --standalone

# automatic renewal
echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | sudo tee -a /etc/crontab > /dev/null

# make sure it's working
sudo certbot renew --dry-run

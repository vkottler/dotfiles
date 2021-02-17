#!/bin/bash -x
set -e
pulseaudio -k
sudo alsa force-reload

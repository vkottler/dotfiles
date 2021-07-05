#!/bin/bash
set -e && set -x

# install it
curl https://apt.secrethub.io | sudo bash

echo "Run 'secrethub credential backup' on an existing machine."
secrethub init

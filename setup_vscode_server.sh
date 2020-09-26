#!/bin/bash

curl -fsSL https://code-server.dev/install.sh | sh
sudo systemctl enable --now code-server@$USER

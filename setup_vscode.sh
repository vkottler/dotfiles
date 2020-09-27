#!/bin/bash

source functions.sh

# install vscodium
source_if_ubuntu bash_deps/ubuntu_install_vscodium.sh link_deps/noop.sh

# install code server
curl -fsSL https://code-server.dev/install.sh | sh
sudo systemctl enable --now code-server@$USER

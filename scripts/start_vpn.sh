#!/bin/bash

echo PASSWORD | sudo openconnect --authgroup IP-pool -u vkottler --passwd-on-stdin wiscvpn.doit.wisc.edu &

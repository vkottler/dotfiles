#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
CWD=$REPO/bash/minecraft
source $CWD/common.sh

wget -O $SERVER https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar

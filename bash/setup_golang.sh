#!/bin/bash

VERSION=1.15.2
FILE=go$VERSION.linux-amd64.tar.gz
wget https://golang.org/dl/$FILE
sudo tar -C /usr/local -xzf $FILE
rm $FILE

#!/bin/bash

set -e && set -x

if [[ "`hostname -f`" == *"spacex.corp"* ]]; then
	git config --global user.email "Vaughn.Kottler@spacex.com"
	git config --global user.name "Vaughn Kottler"
else
	git config --global user.email "vaughnkottler@gmail.com"
	git config --global user.name "Vaughn Kottler"
fi

git config --global init.defaultBranch master

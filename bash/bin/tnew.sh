#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "provide a name parameter"
	exit 1
fi

NAME=${PWD##*/}
tmux new -s $1-$NAME

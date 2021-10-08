#!/bin/bash

if [ ! -f $1 ]; then
	echo "'$1' is not a file."
fi

CLIP=clipboard

cat $1 | $CLIP

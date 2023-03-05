#!/bin/bash

xvfb-run gource -1280x720 -r 60 -o - | ffmpeg \
	-y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 \
	-preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 \
	gource.mp4

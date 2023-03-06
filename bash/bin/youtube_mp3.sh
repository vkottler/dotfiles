#!/bin/bash

youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 "$1"

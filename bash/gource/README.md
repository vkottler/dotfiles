# gource

Website: https://gource.io/
Source: https://github.com/acaudwell/Gource

Some additional `apt` packages to install:
* `xorg-dev` (otherwise program does nothing)
* `xvfb` so we can `xvfb-run` and not need a display
* `ffmpeg`
* `libx264-dev` not sure if we need this

Building from source seemed to work, but we installed quite a few packages
to do it.

Would like to try letting this run to completion to see what it creates. It
definitely needs to be sped up though.

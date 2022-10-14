NAS_HOST=kottler-nas
NAS_DEST=$HOME/mnt

SHARES="8TB_striped_mechanical_0"
SHARES+=" 6TB_single_mechanical_0"
SHARES+=" 6TB_single_mechanical_1"

INST=1
DEST=/dev/md$INST

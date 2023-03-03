NAS_HOST=kottler-nas
NAS_DEST=$HOME/mnt

SHARES="4TB_mirrored_mechanical_0"
SHARES+=" 6TB_single_mechanical_0"
SHARES+=" 6TB_single_mechanical_1"

INST=3
DEST=/dev/md$INST

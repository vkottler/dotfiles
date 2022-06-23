#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh
CWD=$REPO/bash/mounting
source $CWD/common.sh

LEVEL=mirror
FS=ext4

DRIVE_1=sdd
DRIVE_2=sde

sudo mdadm \
	--create $DEST \
	--level=$LEVEL \
	--raid-devices=2 /dev/$DRIVE_1 /dev/$DRIVE_2
echo "Created device."

sudo mdadm --detail --scan | sudo tee -a $CWD/mdadm.conf
sudo mdadm --detail $DEST
echo "Updated '$CWD/mdadm.conf'."

sudo mkfs.$FS $DEST
echo "Applied '$FS' file-system."

NAS=/mnt/nas$INST
sudo mkdir -p $NAS
echo "$DEST $NAS $FS defaults 0 2" > $CWD/fstab
echo "Updated '$CWD/fstab'."

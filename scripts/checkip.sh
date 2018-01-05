#!/bin/bash

WORKING_DIR=/home/vkottler/ip
IP_FILE=$WORKING_DIR/ip.txt

OLD_IP=$(cat $IP_FILE)
NEW_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

echo $NEW_IP > $IP_FILE

if [ "$OLD_IP" != "$NEW_IP" ]; then
	cat $WORKING_DIR/email.txt > $WORKING_DIR/temp.txt
	echo "Old IP: $OLD_IP" >> $WORKING_DIR/temp.txt
	echo "New IP: $NEW_IP" >> $WORKING_DIR/temp.txt
	/usr/sbin/ssmtp vkottler@wisc.edu < $WORKING_DIR/temp.txt
	rm $WORKING_DIR/temp.txt
fi

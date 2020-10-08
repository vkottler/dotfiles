#!/bin/bash

print_spaces() {
	count=$1
	printf "%-${count}s" " "
}

# get the longest item length
MAX_LEN=0
for f in *; do
	CURR_LEN=${#f}
	if [ $CURR_LEN -gt $MAX_LEN ]; then
		MAX_LEN=$CURR_LEN
	fi
done
MAX_LEN=$((MAX_LEN+4))

for f in *; do
	CURR_LEN=${#f}
	NUM_SPACES=$((MAX_LEN-CURR_LEN))
	printf $f
	print_spaces $NUM_SPACES
	du -chL $f 2>/dev/null | tail -n 1
done

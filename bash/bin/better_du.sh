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

FILES=`ls -A`
declare -a RESULTS
for f in $FILES; do
	CURR_LEN=${#f}
	NUM_SPACES=$((MAX_LEN-CURR_LEN))
	printf $f
	print_spaces $NUM_SPACES
	RESULT=`du -chL $f 2>/dev/null | tail -n 1 | sed -e 's/\s.*$//'`
	RESULTS+=($RESULT)
	echo $RESULT
done

echo "----------------------------------------"

# build total
TOTAL_SIZE=0.0
for ELEM in "${RESULTS[@]}"; do
	NUM=${ELEM::-1}
	ITER_SIZE=0.0
	case "$ELEM" in
		*K)
			ITER_SIZE=$(echo "$NUM * 1024" | bc)
		;;
		*M)
			ITER_SIZE=$(echo "$NUM * 1024 * 1024" | bc)
		;;
		*G)
			ITER_SIZE=$(echo "$NUM * 1024 * 1024 * 1024" | bc)
		;;
	esac
	TOTAL_SIZE=$(echo "$TOTAL_SIZE + $ITER_SIZE" | bc)
done

# print total
RESULT=`numfmt --to=iec-i --suffix=B $TOTAL_SIZE`
echo "total: $RESULT"

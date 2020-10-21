#!/bin/bash

source functions.sh

# check that $1 is a git repository
test -d $1
SRC_PATH=$(readlink -m $1)
git -C $SRC_PATH rev-parse
GIT_ROOT=`git -C $1 rev-parse --show-toplevel`
if [ "$SRC_PATH" != "$GIT_ROOT" ]; then
	echo "'$SRC_PATH' must be a git-repository root, found: '$GIT_ROOT'"
	exit 1
fi

# check that $2 is reachable
attempt_ping $2

# make sure the destination is empty
if ssh $USER@$2 test -d $SRC_PATH; then
	echo "'$SRC_PATH' exists on '$2', exiting"
	exit 1
fi

# send over a script, otherwise everything gets weird through ssh tunnel
TMP_SCRIPT=/tmp/reverse_clone.sh
echo "#!/bin/bash" > $TMP_SCRIPT
chmod +x $TMP_SCRIPT
echo "set -e" >> $TMP_SCRIPT
echo "git clone $(hostname):$SRC_PATH $SRC_PATH" >> $TMP_SCRIPT
echo "cd $SRC_PATH/bash && ./link_files.sh"

# copy the script over then remove it
scp $TMP_SCRIPT $USER@$2:~/reverse_clone.sh
rm $TMP_SCRIPT

SCRIPTS=$REPO/bash

source $SCRIPTS/bin/functions.sh

# Prefer installing under our home tree, rather than e.g. '/usr/local'.
THIRD_PARTY_PREFIX=$HOME/.local

call_setup() {
	$SCRIPTS/setup_$1.sh
}

set -e

SCRIPTS=$REPO/bash

source $SCRIPTS/bin/functions.sh

source $SCRIPTS/config.site

# Prefer installing under our home tree, rather than e.g. '/usr/local'.
THIRD_PARTY_PREFIX=$LOCAL

PREFIX_ARG="--prefix=$THIRD_PARTY_PREFIX"
CMAKE_ARGS="-G Ninja -DCMAKE_INSTALL_PREFIX=$CMAKE_INSTALL_PREFIX"
CMAKE_ARGS+=" -DCMAKE_BUILD_TYPE=Release"

call_setup() {
	$SCRIPTS/setup_$1.sh
}

set -e

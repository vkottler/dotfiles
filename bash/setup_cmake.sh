#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
source "$REPO/bash/common.sh"

call_setup ninja
call_setup sphinx
call_setup openssl

exit_if_command cmake

clone_third_party_github Kitware CMake

pushd "$THIRD_PARTY/CMake" >/dev/null

ARGS=("$PREFIX_ARG")

if command -v nproc >/dev/null; then
	ARGS+=("--parallel=$(nproc)")
fi

# Build docs with sphinx if its installed.
if command -v sphinx-build >/dev/null; then
	ARGS+=("--sphinx-man" "--sphinx-html" "--sphinx-info")
fi

# Use ninja if its installed.
if command -v ninja >/dev/null; then
	ARGS+=("--generator=Ninja")
fi

# Build and install cmake.
./bootstrap "${ARGS[@]}"
ninja && ninja install

popd >/dev/null

#!/bin/bash

REPO=`git rev-parse --show-toplevel`
source $REPO/bash/common.sh

pushd $REPO/third-party/vim >/dev/null

# Download third-party syntax highlighting scripts.
wget https://www.vim.org/scripts/download_script.php?src_id=8666 -O jinja.vim
wget https://www.vim.org/scripts/download_script.php?src_id=6961 -O htmljinja.vim

popd >/dev/null

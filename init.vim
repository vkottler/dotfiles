set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" include shared settings
source ~/.vimrc-common

" include plugins
source ~/.vimrc-plugins

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc-common

" declare plugins, install with :PlugInstall if necessary
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
call plug#end()

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc-common

" declare plugins, install with :PlugInstall if necessary
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
call plug#end()

let g:rustfmt_autosave = 1

nmap <leader>g :TagbarToggle<CR>

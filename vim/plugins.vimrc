" declare plugins, install with :PlugInstall if necessary
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'pprovost/vim-ps1'
call plug#end()

" We could format on save, but I find that it can hang when you save knowing
" something is already wrong.
let g:rustfmt_autosave = 0
nnoremap <leader>rf :RustFmt<CR>

nmap <leader>g :TagbarToggle<CR>
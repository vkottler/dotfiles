" declare plugins, install with :PlugInstall if necessary
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
" Plug 'majutsushi/tagbar'
Plug 'pprovost/vim-ps1'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ["yamllint"]

" We could format on save, but I find that it can hang when you save knowing
" something is already wrong.
let g:rustfmt_autosave = 0
nnoremap <leader>rf :RustFmt<CR>

" nmap <leader>g :TagbarToggle<CR>
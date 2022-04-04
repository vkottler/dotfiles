" declare plugins, install with :PlugInstall if necessary
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
Plug 'pprovost/vim-ps1'
" not working right now
" Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'psf/black', { 'branch': 'stable' }
call plug#end()

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ["yamllint"]
let g:syntastic_python_checkers=["mypy", "pylint", "flake8"]

" black settings
let g:black_linelength = 79
autocmd BufWritePre *.py execute ':Black'

" We could format on save, but I find that it can hang when you save knowing
" something is already wrong.
let g:rustfmt_autosave = 0
nnoremap <leader>rf :RustFmt<CR>

" nmap <leader>g :TagbarToggle<CR>
" unused settings, sometimes useful to keep around for reference

" call plug#begin('~/.vim/plugged')

" obsolete
" Plug 'psf/black', { 'branch': 'stable' }
" Plug 'vim-syntastic/syntastic'

" plugin dog house
" Plug 'tpope/vim-fugitive'

" call plug#end()

" nmap <leader>g :TagbarToggle<CR>

" syntastic settings
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_yaml_checkers = ["yamllint"]
" let g:syntastic_python_checkers=["mypy", \"pylint", \"flake8"]

" black settings
" let g:black_linelength = 79
" autocmd BufWritePre *.py execute ':Black'

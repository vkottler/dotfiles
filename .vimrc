" http://tnerual.eriogerg.free.fr/vimqrc.html
"
" Cheat sheet ^^^^^
"
" Vaughn Kottler .vimrc
" Last updated 3/17/2017
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't worry about vi compatibility
set nocompatible

" Turn on syntax highlighting
syntax on

" Show line numbers
set number

" Encoding
set encoding=utf-8

" Searching
set ignorecase
set smartcase
set showmatch

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>

" Navigating Tabs
map <leader>p :tabp<CR>
map <leader>n :tabn<CR>
map <leader>t :tab split +Explore<CR>

" Tab Character Spacing
set tabstop=4
set shiftwidth=4

" Quick Insertion
nnoremap <Space> i_<Esc>r
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


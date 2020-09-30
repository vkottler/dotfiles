"
" http://tnerual.eriogerg.free.fr/vimqrc.html
"

" include shared settings
source ~/.vimrc-common

" automatically install the plugin manager if it's not there
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" include plugins
source ~/.vimrc-plugins

set nocompatible				" Don't worry about vi compatibility
filetype plugin indent on		" Required for Vundle (?)
set autoread					" Detect when a file is changed
colorscheme torte				" Chosen color scheme

" Turn on syntax highlighting
syntax on
set showmode

" Preserve transparent background
hi Normal guibg=NONE ctermbg=NONE

set number relativenumber		" Show line numbers
set encoding=utf-8				" Encoding

" Searching
set ignorecase
set smartcase
set showmatch
set hlsearch
set incsearch

" Line wrapping
set wrap
set linebreak

" Tab Character Spacing
set tabstop=4
set shiftwidth=4
set expandtab

" HTML autocomplete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Kernel-style C
autocmd FileType c call SetKernelRules()
autocmd FileType h call SetKernelRules()
function SetKernelRules()
    set tabstop=8
    set softtabstop=8
    set shiftwidth=8
    set noexpandtab
endfunction

" Status Line
set laststatus=2                               " always show status line
set statusline=%<%f\                           " Filename
set statusline+=%w%h%m%r                       " Options
set statusline+=\ [%{&ff}/%Y]                  " filetype
set statusline+=\ [%{split(getcwd(),'/')[-1]}] " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%        " Right aligned file nav info
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Windows / GVim
" set expandtab
" filetype plugin indent on
" set backspace=indent,eol,start

set fdm=syntax
set foldlevelstart=20
set noeb vb t_tb=

" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if &term =~ '^xterm'
    " normal mode
    let &t_EI .= "\<Esc>[0 q"
    " insert mode
    let &t_SI .= "\<Esc>[6 q"
endif

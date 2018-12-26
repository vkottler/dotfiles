" http://tnerual.eriogerg.free.fr/vimqrc.html
"
" Cheat sheet ^^^^^
"
" Vaughn Kottler .vimrc
" Last updated 3/17/2017
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" automatically install the plugin manager if it's not there
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" declare plugins, install with :PlugInstall if necessary
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
call plug#end()

set nocompatible				" Don't worry about vi compatibility
filetype plugin indent on		" Required for Vundle (?)
set autoread					" Detect when a file is changed
set colorcolumn=80				" 80 character limit reminder
colorscheme torte				" Chosen color scheme

" Turn on syntax highlighting
syntax on
set showmode

" Preserve transparent background
hi Normal guibg=NONE ctermbg=NONE

set number						" Show line numbers
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

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>

" Show trailing whitespace and spaces for tabs
map <leader>L /\s\+$<CR>

" Navigating Tabs
" New WinMove function may replace these
map <leader>p :tabp<CR>
map <leader>n :tabn<CR>
map <leader>t :tab split +Explore<CR>
map <leader>T :Explore<CR>

" Tab Character Spacing
set tabstop=4
set shiftwidth=4
set expandtab

" Quick Insertion
nnoremap <Space> i_<Esc>r

" HTML autocomplete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Functions                                    "
"                                                                             "
" WinMove from https://github.com/nicknisi/vim-workshop/                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fdm=syntax
set foldlevelstart=20
set noeb vb t_tb=

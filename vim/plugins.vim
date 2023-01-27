" declare plugins, install with :PlugInstall if necessary
let g:plug_url_format = 'git@github.com:%s.git'
call plug#begin('~/.vim/plugged')

" mechanical
Plug 'jiangmiao/auto-pairs'
" Plug 'ctrlpvim/ctrlp.vim'

Plug 'dense-analysis/ale'

" languages
Plug 'rust-lang/rust.vim'
Plug 'pprovost/vim-ps1'
Plug 'leafgarland/typescript-vim'

" cosmetic
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

call plug#end()

" from vim-colorschemes
colo atom

let g:airline#extensions#ale#enabled = 1

" ale settings
let g:ale_c_cc_executable = "gcc"
let g:ale_cpp_cc_executable = "g++"
let g:ale_linters = {
\   'cpp': ['clangd', 'cc'],
\   'python': ['flake8', 'mypy', 'pylint', 'pylsp'],
\   'typescript': ['tsserver', 'eslint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format'],
\   'python': ['isort', 'black'],
\   'typescript': ['prettier', 'eslint'],
\   'html': ['prettier'],
\}
let g:ale_python_pylsp_config = {}
let line_length = '--line-length 79'
let g:ale_python_black_options = line_length
let g:ale_python_isort_options = line_length . ' --profile black --fss -m 3'
let g:ale_fix_on_save = 1

" We could format on save, but I find that it can hang when you save knowing
" something is already wrong.
let g:rustfmt_autosave = 0
nnoremap <leader>rf :RustFmt<CR>

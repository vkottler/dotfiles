"
" mostly keybindings, allows all vim-variants to share behavior while keeping
" their otherwise default behaviors
"

" 80 character limit reminder
set colorcolumn=80

" load common binds
call IncludeScript("simple_keybinds")

" allow buffers to be hidden
set hidden

" fix newlines by default
set fixeol

" visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
nnoremap <leader>l :set list!<CR>

" show trailing whitespace and spaces for tabs
nnoremap <leader>L /\s\+$<CR>
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" navigating tabs
nnoremap <leader>t :tab split +Explore<CR>
nnoremap <leader>T :Explore<CR>

" WinMove from https://github.com/nicknisi/vim-workshop/
nnoremap <C-h> :call WinMove('h')<cr>
nnoremap <C-j> :call WinMove('j')<cr>
nnoremap <C-k> :call WinMove('k')<cr>
nnoremap <C-l> :call WinMove('l')<cr>

" Prevent netrw's <C-l> overriding our mapping
augroup netrw_mapping
    au!
    au FileType netrw map <buffer> <C-l> :call WinMove('l')<cr>
augroup END

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

augroup indent_settings
    au!
    au BufNewFile,BufReadPost *.j2 set filetype=jinja foldmethod=indent
    au BufNewFile,BufReadPost *.html.j2 set filetype=htmljinja foldmethod=indent
    au BufNewFile,BufReadPost *.eyaml set filetype=yaml foldmethod=indent
    au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab foldmethod=indent
    au FileType html setlocal ts=2 sts=2 sw=2 expandtab
    au FileType css setlocal ts=2 sts=2 sw=2 expandtab
    au FileType jinja setlocal ts=2 sts=2 sw=2 expandtab
    au FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
    au FileType bzl setlocal ts=4 sts=4 sw=4 expandtab
    au FileType c setlocal ts=4 sts=4 sw=4 expandtab
    au FileType cpp setlocal ts=4 sts=4 sw=4 expandtab
    au FileType json setlocal ts=4 sts=4 sw=4 expandtab foldmethod=indent
    au FileType xml setlocal foldmethod=syntax
augroup END

" set variables to trigger other file-type settings
let ft_bzl_fold=1
let g:xml_syntax_folding=1
let python_recommended_style=1

" enable folding, set binds
set foldenable
nnoremap f za
nnoremap F zA
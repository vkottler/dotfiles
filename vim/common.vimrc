"
" mostly keybindings, allows all vim-variants to share behavior while keeping
" their otherwise default behaviors
"

" 80 character limit reminder
set colorcolumn=80

" load common binds
call IncludeScript("simple_keybinds")

" visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
nnoremap <leader>l :set list!<CR>

" show trailing whitespace and spaces for tabs
nnoremap <leader>L /\s\+$<CR>

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
    au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    au FileType html setlocal ts=2 sts=2 sw=2 expandtab
    au FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" enable folding, set binds
set foldenable
nnoremap f za
nnoremap F zA
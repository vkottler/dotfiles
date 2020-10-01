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
map <leader>l :set list!<CR>

" show trailing whitespace and spaces for tabs
map <leader>L /\s\+$<CR>

" navigating tabs
map <leader>t :tab split +Explore<CR>
map <leader>T :Explore<CR>

" WinMove from https://github.com/nicknisi/vim-workshop/
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Prevent netrw's <C-l> overriding our mapping
augroup netrw_mapping
    autocmd!
    autocmd FileType netrw map <buffer> <C-l> :call WinMove('l')<cr>
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

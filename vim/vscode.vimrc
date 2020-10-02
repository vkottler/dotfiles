if has("win32")
    let $MYVIMRC = $HOME . "\\AppData\\Local\\nvim\\init.vim"
else
    let $MYVIMRC = $HOME . "/.config/nvim/init.vim"
endif

" load common binds
call IncludeScript("simple_keybinds")

" visualize tabs and newlines
map <leader>l :call VSCodeNotify('editor.action.toggleRenderWhitespace')<CR>

" navigating tabs
" TODO - these need to provide some kind of legitimate file browsing
map <leader>t :enew<CR>
map <leader>T :enew!<CR>

" navigating tabs
map <C-h> :call WinMove('Left')<CR>
map <C-j> :call WinMove('Down')<CR>
map <C-k> :call WinMove('Up')<CR>
map <C-l> :call WinMove('Right')<CR>

" move to the window in the direction shown, or create a new window
function! WinMove(direction)
    let t:curwin = winnr()

    " we prefer 'navigate' over 'focus{a:direction}Group' because it won't wrap
    " relevant: https://github.com/microsoft/vscode/issues/107873
    call VSCodeCall('workbench.action.navigate' . a:direction)

    sleep 100m " yikes... can't seem to find any other way

    " echo t:curwin . " => " . winnr()
    if (t:curwin == winnr())
        call VSCodeCall('workbench.action.splitEditor' . a:direction)
    endif
endfunction
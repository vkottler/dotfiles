if has("win32")
    let $MYVIMRC = $HOME . "\\AppData\\Local\\nvim\\init.vim"
else
    let $MYVIMRC = $HOME . "/.config/nvim/init.vim"
endif

" load common binds
call IncludeScript("simple_keybinds")

" visualize tabs and newlines
" TODO

" navigating tabs
map <C-h> :call WinMove('Left')<cr>
map <C-j> :call WinMove('Down')<cr>
map <C-k> :call WinMove('Up')<cr>
map <C-l> :call WinMove('Right')<cr>

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

" creating new tabs and exploring files
" TODO
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
map <C-j> :call WinMove('Below')<cr>
map <C-k> :call WinMove('Above')<cr>
map <C-l> :call WinMove('Right')<cr>

" move to the window in the direction shown, or create a new window
function! WinMove(direction)
    let t:curwin = winnr()

    " the assumption that this command won't wrap turned out to be wrong,
    " seriously unfortunate...
    call VSCodeCall('workbench.action.focus' . a:direction . 'Group')

    sleep 200m " yikes... can't seem to find any other way

    echo t:curwin . " => " . winnr()

    if (t:curwin == winnr())
        if (a:direction == 'Left' || a:direction == 'Right')
            call VSCodeCall('workbench.action.splitEditor' . a:direction)
        elseif (a:direction == 'Above')
            call VSCodeCall('workbench.action.splitEditorUp')
        else
            call VSCodeCall('workbench.action.splitEditorDown')
        endif
    endif
endfunction

" split and navigate splits
" TODO
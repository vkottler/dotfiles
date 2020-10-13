set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

function! IncludeScript(file)
	let l:include_path = "~/.vim/"
	if exists('$USER')
		let l:include_path .= $USER . "/"
	elseif exists('$USERNAME')
		let l:include_path .= $USERNAME . "/"
	else
		echo "Can't find include path via $USER or $USERNAME"
		finish
	endif
	let l:include_path .= a:file . ".vimrc"
	exec "source " . l:include_path
endfunction

if !exists('g:vscode')
	" include shared settings
	call IncludeScript("common")

	" include plugins
	call IncludeScript("plugins")

	colo slate
else
	call IncludeScript("vscode")
endif

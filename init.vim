set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if ! exists("loaded_files")
	let loaded_files = [$MYVIMRC]
endif

if ! exists("*LoadFile")
	function! LoadFile(file)
		let l:include_path = resolve(expand(a:file))
		if index(g:loaded_files, l:include_path) == -1
			exec "source " . l:include_path
			call add(g:loaded_files, l:include_path)
		endif
	endfunction
endif

if ! exists("*IncludeScript")
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
		call LoadFile(l:include_path)
	endfunction
endif

if !exists('g:vscode')
	colo koehler

	" include shared settings
	call IncludeScript("common")

	" include plugins
	call IncludeScript("plugins")

	" include a local .vimrc, if one exists
	if resolve(expand(getcwd())) !=  resolve(expand("~"))
	let local_vimrc = getcwd() . "/.vimrc"
		if filereadable(local_vimrc)
			call LoadFile(local_vimrc)
		endif
	endif
else
	call IncludeScript("vscode")
endif

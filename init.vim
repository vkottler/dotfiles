set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if ! exists("loaded_files")
	let curr_vimrc = resolve(expand($MYVIMRC))
	let loaded_files = [curr_vimrc]

	" ensure that .vimrc in $HOME isn't loaded (or re-loaded)
	let curr_vimrc = resolve(expand("~/.vimrc"))
	if index(loaded_files, curr_vimrc) == -1
		call add(loaded_files, curr_vimrc)
	endif
endif

if ! exists("*LoadFile")
	function! LoadFile(file)
		let l:include_path = resolve(expand(a:file))
		if filereadable(l:include_path) && index(g:loaded_files, l:include_path) == -1
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

		" check all viable suffixes
		for suffix in [".vim", ".vimrc"]
			call LoadFile(l:include_path . a:file . suffix)
		endfor
	endfunction
endif

if !exists('g:vscode')
	colo koehler

	" include shared settings
	call IncludeScript("common")

	" include plugins
	call IncludeScript("plugins")

	" include a local .vimrc, if one exists
	let local_vimrc = getcwd() . "/.vimrc"
	if filereadable(local_vimrc)
		call LoadFile(local_vimrc)
	endif
else
	call IncludeScript("vscode")
endif

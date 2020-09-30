set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if !exists('g:vscode')
	" include shared settings
	source ~/.vimrc-common
	" include plugins
	source ~/.vimrc-plugins
endif

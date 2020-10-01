set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if !exists('g:vscode')
	" include shared settings
	source ~/.vim/$USER/common.vimrc

	" include plugins
	source ~/.vim/$USER/plugins.vimrc
else
	source ~/.vim/$USER/vscode.vimrc
endif
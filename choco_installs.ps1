#requires -version 4.0
#requires -runasadministrator

choco upgrade -y neovim vscodium microsoft-windows-terminal git rust

# install neovim plugin manager
$PlugDest = "$HOME\vimfiles\autoload\plug.vim"
if ( -Not ( Test-Path $PlugDest ) ) {
	iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $PlugDest -Force
}

# python global packages
pip install --upgrade pip
pip install --upgrade grip

choco list -localonly

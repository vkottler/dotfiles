#requires -version 4.0
#requires -runasadministrator

# consider: discord, audacity
choco upgrade -y vscodium microsoft-windows-terminal git rust vlc slack chromium carnac
choco upgrade -y neovim --pre

# install base extensions
codium --install-extension asvetliakov.vscode-neovim
codium --install-extension dunstontc.viml

# install neovim plugin manager
$PlugDest = "$HOME\vimfiles\autoload\plug.vim"
if ( -Not ( Test-Path $PlugDest ) ) {
	iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $PlugDest -Force
}

# python global packages
pip install --upgrade pip
pip install --upgrade grip

choco list -localonly

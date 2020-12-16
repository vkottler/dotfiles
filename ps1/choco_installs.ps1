#requires -version 4.0
#requires -runasadministrator

# consider: discord, audacity
choco upgrade -y microsoft-windows-terminal git rust vlc slack chromium carnac
choco upgrade -y screentogif drawio discord spotify
choco upgrade -y vscodium --pre
choco upgrade -y neovim

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

# set git identity
git config --global user.email "vaughnkottler@gmail.com"
git config --global user.name "Vaughn Kottler"

choco list -localonly

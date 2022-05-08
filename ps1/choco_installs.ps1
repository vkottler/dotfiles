#requires -version 4.0
#requires -runasadministrator

# install things that we will probably always use on a windows box
choco upgrade -y microsoft-windows-terminal git vlc
choco upgrade -y discord spotify
choco upgrade -y neovim
choco upgrade -y winrar

# dog house
#choco upgrade -y slack chromium

# install neovim plugin manager
$PlugDest = "$HOME\vimfiles\autoload\plug.vim"
if ( -Not ( Test-Path $PlugDest ) ) {
	iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $PlugDest -Force
}

# set git identity
git config --global user.email "vaughnkottler@gmail.com"
git config --global user.name "Vaughn Kottler"

choco list -localonly

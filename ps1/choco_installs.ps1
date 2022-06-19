#requires -version 4.0
#requires -runasadministrator

# install things that we will probably always use on a windows box
choco upgrade -y microsoft-windows-terminal git vlc
choco upgrade -y discord spotify
choco upgrade -y neovim
choco upgrade -y winrar

# dog house
#choco upgrade -y slack chromium

# set git identity
git config --global user.email "vaughnkottler@gmail.com"
git config --global user.name "Vaughn Kottler"
git config --global core.editor nvim

choco list -localonly

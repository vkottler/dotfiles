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
& .\setup_git.ps1

choco list -localonly

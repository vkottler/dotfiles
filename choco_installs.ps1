#requires -version 4.0
#requires -runasadministrator

choco upgrade -y neovim vscodium microsoft-windows-terminal git rust

# set up windows terminal config

choco list -localonly

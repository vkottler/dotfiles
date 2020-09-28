#requires -version 4.0
#requires -runasadministrator

choco upgrade -y neovim vscodium microsoft-windows-terminal git rust

choco list -localonly

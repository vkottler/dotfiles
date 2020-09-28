#requires -version 4.0
#requires -runasadministrator

choco upgrade -y neovim vscodium microsoft-windows-terminal git rust

# python global packages
pip install --upgrade pip
pip install --upgrade grip

choco list -localonly

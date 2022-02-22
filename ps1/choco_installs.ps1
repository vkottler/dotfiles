#requires -version 4.0
#requires -runasadministrator

# install things that we will probably always use on a windows box
choco upgrade -y microsoft-windows-terminal git rust vlc slack chromium carnac
choco upgrade -y screentogif drawio discord spotify audacity bitwig
choco upgrade -y neovim
choco upgrade -y obs-studio
choco upgrade -y python
choco upgrade -y winrar

# VSCodium isn't usable, see:
# https://github.com/VSCodium/vscodium/discussions/832#discussioncomment-2225387
# choco upgrade -y vscodium --pre
# install base extensions
# codium --install-extension asvetliakov.vscode-neovim
# codium --install-extension dunstontc.viml

# install Visual Studio Code
choco upgrade -y vscode-insiders
code-insiders.cmd --install-extension asvetliakov.vscode-neovim
code-insiders.cmd --install-extension dunstontc.viml
code-insiders.cmd --install-extension ms-vscode-remote.vscode-remote-extensionpack
code-insiders.cmd --install-extension ms-python.python

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

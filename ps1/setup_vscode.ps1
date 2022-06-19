#requires -version 4.0
#requires -runasadministrator

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

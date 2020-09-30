# clone posh-git if necessary
if ( -Not ( Test-Path $HOME\posh-git ) ) {
    git clone git@github.com:dahlbyk/posh-git.git $HOME\posh-git
}

# better prompt
Import-Module $HOME\posh-git\src\posh-git.psd1

# useful aliases
Set-Alias -Name vim -Value nvim

Write-Output $PSVersionTable.PSVersion

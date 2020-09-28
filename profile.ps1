# clone posh-git if necessary
if ( -Not ( Test-Path $HOME\posh-git ) ) {
    git clone git@github.com:dahlbyk/posh-git.git $HOME\posh-git
}

Import-Module $HOME\posh-git\src\posh-git.psd1

Write-Output $PSVersionTable.PSVersion

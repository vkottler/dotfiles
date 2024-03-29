Import-Module $HOME\functions.ps1 -Force

New-Item -Type Directory -Path $third_party -ErrorAction SilentlyContinue

# clone posh-git if necessary
if ( -Not ( Test-Path $third_party\posh-git ) ) {
    git clone git@github.com:dahlbyk/posh-git.git $third_party\posh-git
}

# clone vim-plug if necessary
if ( -Not ( Test-Path $third_party\vim-plug ) ) {
    git clone git@github.com:junegunn/vim-plug.git $third_party\vim-plug
}

# install vim-plug if necessary
if ( -Not ( Test-Path "$env:LOCALAPPDATA\nvim-data\site\autoload\plug.vim" ) ) {
    Link-Local plug.vim "$env:LOCALAPPDATA\nvim-data\site\autoload" -SrcRoot $third_party\vim-plug
}

# better prompt
if (Test-Path $third_party\posh-git\src\posh-git.psd1) {
    Import-Module $third_party\posh-git\src\posh-git.psd1
}

function Run-Administrator([string]$Command) {
    Run-SubShell $Command -AsAdmin $true -PrintCommand $true
}

function Fls-Stub {
    Invoke-Expression "explorer ."
}

function Run-Grip {
    $GripTokenPath = [string]::Format("{0}\grip_access_token.txt", $HOME)
    if ( Test-Path $GripTokenPath ) {
        $GripToken = Get-Content $GripTokenPath -Raw
        $GripToken = $GripToken.Trim("`n", "`r", " ")
        $FinalCommand = [string]::Format("grip --pass {0} -b", $GripToken)
    } else {
        $ErrorStr = [string]::Format("Can't find '{0}'!", $GripTokenPath)
        Write-Error $ErrorStr
        $FinalCommand = "grip -b"
    }

    Run-SubShell $FinalCommand -ShouldExit $true
}

# useful aliases
Set-Alias -Name grep -Value Select-String
Set-Alias -Name vim -Value nvim
Set-Alias -Name sudo -Value Run-Administrator
Set-Alias -Name md -Value Run-Grip -Option AllScope
Set-Alias -Name fls -Value Fls-Stub

# https://github.com/VSCodium/vscodium/discussions/832#discussioncomment-2225387
# Set-Alias -Name code -Value codium
# Set-Alias -Name vscode -Value codium
Set-Alias -Name code -Value code-insiders.cmd
Set-Alias -Name vscode -Value code-insiders.cmd

# add things to path
Add-Path $HOME\venv\Scripts
Add-Path "C:\Program Files\CMake\bin"
Add-Path $HOME\.cargo\bin

# get Python version
function Set-Python-Version {
    $output = & python --version
    if ( $output ) {
        $semver = $output.split(" ")[1].split(".")
        $env:PYTHON_VERSION = [string]::Format("{0}.{1}", $semver[0], $semver[1])
    }
}
Set-Python-Version
$PYTHON_VERSION = $env:PYTHON_VERSION

Write-Output $PSVersionTable.PSVersion

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

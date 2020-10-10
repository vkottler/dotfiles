# clone posh-git if necessary
if ( -Not ( Test-Path $HOME\posh-git ) ) {
	git clone git@github.com:dahlbyk/posh-git.git $HOME\posh-git
}

# better prompt
Import-Module $HOME\posh-git\src\posh-git.psd1

function Run-Administrator([string]$Command) {
	$FullCommand = [string]::Format("cd {0}; {1}", $pwd.path, $Command)
	$CommandArgs = New-Object Collections.Generic.List[string]
	$CommandArgs.Add("-NoExit")
	$CommandArgs.Add("-Command")
	$CommandArgs.Add($FullCommand)
	Start-Process powershell -Verb runAs -ArgumentList $CommandArgs
}

# useful aliases
Set-Alias -Name grep -Value Select-String
Set-Alias -Name vim -Value nvim
Set-Alias -Name code -Value codium
Set-Alias -Name vscode -Value codium
Set-Alias -Name sudo -Value Run-Administrator

Write-Output $PSVersionTable.PSVersion

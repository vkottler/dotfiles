Import-Module .\ps1\functions.ps1 -Force

# link our PowerShell profile
$ProfileFilename = Split-Path $PROFILE -leaf
$ProfileDir = Split-Path $PROFILE
$SrcRoot = [string]::Format("{0}\{1}", $pwd.path, "ps1")
Link-Local "profile.ps1" $ProfileDir $ProfileFilename -SrcRoot $SrcRoot

# link ps1 functions so we can not worry where this is checked out
Link-Local "functions.ps1" -SrcRoot $SrcRoot

Link-Local ".vimrc"
Link-Local "vim" $HOME\.vim $env:UserName
Link-Local "init.vim" $HOME\AppData\Local\nvim

# link vscode settings
$SrcRoot = [string]::Format("{0}\{1}", $pwd.path, "vscode")
Link-Local "settings.json" $env:AppData\Code\User -SrcRoot $SrcRoot
Link-Local "settings.json" $env:AppData\VSCodium\User -SrcRoot $SrcRoot

# windows terminal configuration
$WinTermLoc = ls $HOME\AppData\Local\Packages | Select-String WindowsTerminal
if ( $WinTermLoc ) {
	$WinTermLoc = [string]::Format("{0}\{1}", $WinTermLoc, "LocalState")
	$SrcRoot = [string]::Format("{0}\{1}", $pwd.path, "windows_terminal")
	Link-Local "settings.json" $WinTermLoc -SrcRoot $SrcRoot
}

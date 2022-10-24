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

Link-Local "third-party\vim\htmljinja.vim" $HOME\.vim\syntax "htmljinja.vim"
Link-Local "third-party\vim\jinja.vim" $HOME\.vim\syntax "jinja.vim"
Link-Local "third-party\vim\jinja.vim" $HOME\.vim\syntax "j2.vim"

# link vscode settings
$SrcRoot = [string]::Format("{0}\{1}", $pwd.path, "vscode")
$DstPaths = "Code", "Code - Insiders", "VSCodium"
for ($i = 0; $i -lt $DstPaths.Length; $i++)
{
    $DstPath = [string]::Format("{0}\{1}\User", $env:AppData, $DstPaths[$i])
    Link-Local "settings.json" $DstPath -SrcRoot $SrcRoot
}

# windows terminal configuration
New-Item -Type Directory -Path $HOME\AppData\Local\Packages -ErrorAction SilentlyContinue
$WinTermRoot = [string]::Format("{0}\AppData\Local\Packages", $HOME)
$WinTermLoc = ls $WinTermRoot | Select-String WindowsTerminal
if ( $WinTermLoc ) {
    $WinTermLoc = [string]::Format("{0}\{1}\{2}", $WinTermRoot, $WinTermLoc, "LocalState")
    $SrcRoot = [string]::Format("{0}\{1}", $pwd.path, "windows_terminal")
    Link-Local "settings.json" $WinTermLoc -SrcRoot $SrcRoot
}

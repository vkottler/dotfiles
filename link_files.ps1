Import-Module .\functions.ps1 -Force

$ProfileDir = [string]::Format("{0}\Documents\PowerShell", $env:USERPROFILE)
$ProfileFilename = "Microsoft.PowerShell_profile.ps1"

# sanity check we have the right file, we should refactor this to just use
$ProfileFile = [string]::Format("{0}\{1}", $ProfileDir, $ProfileFilename)
# use $PROFILE instead at some point
if ( $ProfileFile -ne $PROFILE ) {
    $ErrorStr = [string]::Format("fix script: {0} != {1}", $ProfileFile, $PROFILE)
    Write-Error $ErrorStr
    exit
} else {
    Link-Local "profile.ps1" $ProfileDir $ProfileFilename
}

Link-Local ".vimrc"
Link-Local ".vimrc-common"
Link-Local ".vimrc-plugins"
Link-Local "init.vim" $HOME\AppData\Local\nvim

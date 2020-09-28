# create user profile dir if it doesn't exist
$ProfileDir = [string]::Format("{0}\Documents\PowerShell", $env:USERPROFILE)
$ProfileFile = [string]::Format("{0}\Microsoft.PowerShell_profile.ps1", $ProfileDir)
md $ProfileDir -ErrorAction SilentlyContinue

# symlink our profile
Remove-Item -Force -ErrorAction SilentlyContinue $ProfileFile
$Command = [string]::Format("cmd /c mklink {0} {1}\profile.ps1", $ProfileFile, $pwd.path)
Invoke-Expression $Command

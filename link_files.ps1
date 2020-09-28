# create user profile dir if it doesn't exist
$ProfileDir = $env:USERPROFILE + "\Documents\WindowsPowerShell"
$ProfileFile = $ProfileDir + "\Microsoft.PowerShell_profile.ps1"
md $ProfileDir -ErrorAction SilentlyContinue

# symlink our profile
$Command = "cmd /c mklink " + $ProfileFile + " " + $pwd.path + "\profile.ps1"
echo $Command
Remove-Item -Force $ProfileFile
PowerShell -Command "$Command"

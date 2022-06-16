#requires -runasadministrator

# check if we actually need to do this
if ( $PSVersionTable.PSVerion.Major -ge 7 ) {
    Write-Output [string]::Format("Powershell is already major version '{0}', exiting.", $PSVersionTable.PSVerion.Major)
    exit
}

# get url and paths set up
$PSVersion = "7.2.4"
$OutFile = [string]::Format("PowerShell-{0}-win-x64.msi", $PSVersion)
$URL = [string]::Format("https://github.com/PowerShell/PowerShell/releases/download/v{0}/{1}", $PSVersion, $OutFile)
$OutFilePath = [string]::Format("{0}\{1}", $pwd.Path, $OutFile)

# download the installer
(New-Object System.Net.WebClient).DownloadFile($URL, $OutFilePath)

# run the installer
$Installer = "msiexec.exe"
$Params = "/package", $OutFilePath, "/passive", "ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1", "ENABLE_PSREMOTING=1", "REGISTER_MANIFEST=1"
& $Installer @Params

# output status
if ( $LastExitCode -eq 0 ) {
    Write-Output "Install succeeded."
} else {
    Write-Output "Install failed."
}

# remove installer (actually don't because it's breaking the script for some reason)
# Remove-Item -Force $OutFilePath

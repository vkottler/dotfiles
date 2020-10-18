#requires -version 4.0
#requires -runasadministrator

# https://docs.microsoft.com/en-us/windows/wsl/install-win10
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# e.g. https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
$Architecture = "x64"
$OutFile = [string]::Format("wsl_update_{0}.msi", $Architecture)
$URL = [string]::Format("https://wslstorestorage.blob.core.windows.net/wslblob/{0}", $OutFile)
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
# remove installer
Remove-Item -Force $OutFilePath

wsl --set-default-version 2

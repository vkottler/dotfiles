#requires -version 4.0
#requires -runasadministrator

# try to update PowerShell if necessary
if ( $PSVersionTable.PSVersion.Major -ne 7 ) {
    & .\install_ps7.ps1
    Write-Output "Run script again from the newly installed PowerShell."
    exit
}

# install choco if necessary
if ( -Not ( Get-Command -ErrorAction SilentlyContinue choco ) ) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Output "Run script again after ensuring 'choco' is available."
    exit
}

& .\choco_installs.ps1

& .\link_files.ps1

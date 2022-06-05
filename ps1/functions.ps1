function Link-Local {
    Param (
        [Parameter(Mandatory=$true)] [string]$SrcFilename,
        [Parameter(Mandatory=$false)] [string]$DestRoot = $HOME,
        [Parameter(Mandatory=$false)] [string]$DestFilename = $SrcFilename,
        [Parameter(Mandatory=$false)] [string]$SrcRoot = $pwd.path
    )

    $SrcAbs = [string]::Format("{0}\{1}", $SrcRoot, $SrcFilename)
    $DestAbs = [string]::Format("{0}\{1}", $DestRoot, $DestFilename)

    # check input file
    if ( -Not ( Test-Path $SrcAbs ) ) {
        $ErrorStr = [string]::Format("'{0}' (src) doesn't exist", $SrcAbs)
        Write-Error
        exit
    }

    # remove target if it exists
    if ( Test-Path $DestAbs ) {
        Remove-Item $DestAbs
        $OutStr = [string]::Format("removing '{0}'", $DestAbs)
        Write-Output $OutStr
    }

    New-Item -Type Directory -Path $DestRoot -ErrorAction SilentlyContinue
    $Command = [string]::Format("cmd /c mklink '{0}' '{1}'", $DestAbs, $SrcAbs)
    $result = Invoke-Expression $Command
    if ( $result -eq $null ) {
        $ErrorStr = [string]::Format("couldn't link '{0}' to '{1}'", $SrcAbs, $DestAbs)
        Write-Error $ErrorStr
        exit
    } else {
        Write-Output $result
    }
}

function Run-SubShell {
    Param (
        [Parameter(Mandatory=$false)] [string]$Command = "",
        [Parameter(Mandatory=$false)] [bool]$ShouldExit = $false,
        [Parameter(Mandatory=$false)] [bool]$AsAdmin = $false,
        [Parameter(Mandatory=$false)] [bool]$PrintCommand = $false
    )

    $CommandArgs = New-Object Collections.Generic.List[string]
    if ( -Not $ShouldExit ) {
        $CommandArgs.Add("-NoExit")
    }
    $CommandArgs.Add("-Command")
    $FullCommand = [string]::Format("cd {0}; {1}", $pwd.path, $Command)
    $CommandArgs.Add($FullCommand)

    if ( $PrintCommand ) {
        Write-Output $Command
    }

    if ( $AsAdmin ) {
        # check if we're already elevated, no idea why this is so hard
        if (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            & $Command
        } else {
            Start-Process pwsh -Verb runAs -ArgumentList $CommandArgs
        }
    } else {
        Start-Process pwsh -ArgumentList $CommandArgs
    }
}

# this is ripped from:
# https://www.splunk.com/en_us/blog/tips-and-tricks/powershell-profiles-and-add-path.html
function Add-Path {
  <#
    .SYNOPSIS
      Adds a Directory to the Current Path
    .DESCRIPTION
      Add a directory to the current path.  This is useful for
      temporary changes to the path or, when run from your
      profile, for adjusting the path within your powershell
      prompt.
    .EXAMPLE
      Add-Path -Directory "C:\Program Files\Notepad++"
    .PARAMETER Directory
      The name of the directory to add to the current path.
  #>

  [CmdletBinding()]
  param (
    [Parameter(
      Mandatory=$True,
      ValueFromPipeline=$True,
      ValueFromPipelineByPropertyName=$True,
      HelpMessage='What directory would you like to add?')]
    [Alias('dir')]
    [string[]]$Directory
  )

  PROCESS {
    $Path = $env:PATH.Split(';')

    foreach ($dir in $Directory) {
      if ($Path -contains $dir) {
        Write-Verbose "$dir is already present in PATH"
      } else {
        if (-not (Test-Path $dir)) {
          Write-Verbose "$dir does not exist in the filesystem"
        } else {
          $Path += $dir
        }
      }
    }

    $env:PATH = [String]::Join(';', $Path)
  }
}

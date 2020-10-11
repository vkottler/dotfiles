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
    $Command = [string]::Format("cmd /c mklink {0} {1}", $DestAbs, $SrcAbs)
    $result = Invoke-Expression $Command
    if ( $result -eq $null ) {
        $ErrorStr = [string]::Format("couldn't link '{0}' to '{1}'", $DestAbs, $SrcAbs)
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
		Start-Process PowerShell -Verb runAs -ArgumentList $CommandArgs
	} else {
		Start-Process PowerShell -ArgumentList $CommandArgs
	}
}

Import-Module .\functions.ps1 -Force

$venv = $HOME + "\venv"

if ( -Not ( Test-Path $venv ) )
{
	python -m venv $venv
}

$python = $venv + "\Scripts\python"

# install packages
$packages = @("pip", "vmklib")
foreach ($package in $packages)
{
	& $python -m pip install --upgrade $package
}

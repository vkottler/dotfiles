Import-Module $HOME\functions.ps1 -Force

$repo = "obs-studio"
Clone-Repository "obsproject" $repo

# From a previous attempt.
# $CMAKE_PREFIX_PATH = $env:CMAKE_PREFIX_PATH
# & .\CI\windows\01_install_dependencies.ps1 -Choco
# cmake -S . -B .\build -DCMAKE_PREFIX_PATH="$CMAKE_PREFIX_PATH"

$Env:CmakeGenerator = "Visual Studio 17 2022"
& .\CI\build-windows.ps1 -Choco Release -Verbose

popd

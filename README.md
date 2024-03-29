# dotfiles

On Linux I mostly use [GNU Bash](https://www.gnu.org/software/bash/) and edit in
[neovim](https://neovim.io/). I prefer [GNOME](https://www.gnome.org/) or
[Pop!\_OS](https://pop.system76.com/) for a graphical environment because those
are the only two I've used that I know how to configure basic keybinds for.

I either use the
[`gnome-terminal`](https://help.gnome.org/users/gnome-terminal/stable/) default
or [`alacritty`](https://github.com/alacritty/alacritty) for a terminal
emulator. [`wezterm`](https://wezfurlong.org/wezterm/) is another good option
that I haven't tried yet.

Recently I've been trying to stand up a usable Windows environment. On Windows
I use [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/)
for an emulator and default it to
[PowerShell](https://docs.microsoft.com/en-us/powershell/).

Below are some notes on setup scripts and configuration files contained in
the repository.

## Usage

Bash scripts can be found in the [`bash`](bash) directory and PowerShell
scripts can be found in the [`ps1`](ps1) directory.

Sripts generally have the form `*_(setup|install).(sh|ps1)` and the script
contents leverage some common shell functions in most cases so they're
easier to read and understand.

**Below are some older notes that I'm keeping in for now.**

### Ubuntu (or [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10))

1. `./`[`link_files.sh`](link_files.sh) symbolically links these files to your
`$HOME` directory
1. `./`[`setup_apt_packages.sh`](setup_apt_packages.sh) installs useful `apt`
packages
1. `./`[`setup_grip.sh`](setup_grip.sh) adds the `md` alias to locally host
rendered [GitHub markdown](https://github.github.com/gfm/)
1. `./`[`setup_nvim.sh`](setup_nvim.sh) installs [Neovim](https://neovim.io/)
and makes it a default terminal editor
1. `./`[`setup_rust.sh`](setup_rust.sh) installs and sets up environment
variables for [Rust](https://www.rust-lang.org/)
1. `./`[`setup_vscode.sh`](setup_vscode.sh) installs and sets up
[VSCodium](https://vscodium.com/)

### Windows 10

It may be necessary to execute `Set-ExecutionPolicy Bypass` to execute `PowerShell`
scripts, as well as running `PowerShell` as an administrator.

1. `.\`[`setup.ps1`](setup.ps1) may need to run multiple times does a few things:
    1. Tries to install [PowerShell 7](https://github.com/PowerShell/PowerShell)
    via `.\`[`install_ps7.ps1`](install_ps7.ps1)
    1. Tries to install [Chocolatey](https://chocolatey.org/) (`choco`)
    1. Runs `.\`[`choco_installs.ps1`](choco_installs.ps1) to install useful
    system dependencies (e.g. text editors)
    1. Runs `.\`[`link_files.ps1`](link_files.ps1) to link our
    [PowerShell Profile](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7)
    ([`profile.ps1`](profile.ps1)) to the correct location, plus other
    configurations

## Design Intent

The goal is to prefer symbolic links to the actual source files in this
repository rather than relying on copies or appends to files.

In [`.gitignore`](.gitignore) we exclude `.bash_includes/*.sh` so that members
of [`bash_deps`](bash_deps) can be "loaded" in via symbolic links when the
relevant setup script is executed and the setup scripts opts to link a file.

Overall, this makes it easier to manage the N+1 case of further automating
something like an initial workstation setup.

## Other Documentation

* [Building OBS Studio in Windows](ps1/setup_obs.md)

# dotfiles

I mostly use `bash` and edit in [neovim](https://neovim.io/) in the terminal.

Trying to make most of the basic, initial environment setup contain as little
jank as possible.

## Usage

Run these commands from your checkout (inside this directory).

1. `./`[`link_files.sh`](link_files.sh) symbolically links these files to your
`$HOME` directory
1. `./`[`setup_apt_packages.sh`](setup_apt_packages.sh) installs useful `apt`
packages
1. `./`[`setup_grip.sh`](setup_grip.sh) adds the `md` alias to locally host
rendered [GitHub markdown](https://github.github.com/gfm/)
1. `./`[`setup_rust.sh`](setup_rust.sh) installs and sets up environment
variables for [Rust](https://www.rust-lang.org/)
1. `./`[`setup_nvim.sh`](setup_nvim.sh) installs [Neovim](https://neovim.io/)
and makes it a default terminal editor
1. `./`[`setup_vscode.sh`](setup_vscode.sh) installs and sets up [VSCodium](https://vscodium.com/)

## Design Intent

The goal is to prefer symbolic links to the actual source files in this
repository rather than relying on copies or appends to files.

In [`.gitignore`](.gitignore) we exclude `.bash_includes/*.sh` so that members
of [`bash_deps`](bash_deps) can be "loaded" in via symbolic links when the
relevant setup script is executed and the setup scripts opts to link a file.

Overall, this makes it easier to manage the N+1 case of further automating
something like an initial workstation setup.

# common / generic
PATH_ENTRIES="$HOME/bin"
PATH_ENTRIES+=" $HOME/.local/bin"

# python
PATH_ENTRIES+=" $HOME/venv/bin"

# rust
PATH_ENTRIES+=" $HOME/.cargo/bin"
PATH_ENTRIES+=" /usr/local/toolchains/rust/cargo/bin"

# node
PATH_ENTRIES+=" $HOME/.npm-packages/bin"

# toolchains
PATH_ENTRIES+=" $HOME/gcc-arm-none-eabi"

# add entries to path and export
for ENTRY in $PATH_ENTRIES
do
	PATH+=":$ENTRY"
done
export PATH=$PATH

# python
PATH_ENTRIES="$HOME/venv/bin"

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
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# add local libraries
export LD_LIBRARY_PATH="$HOME/.local/lib:$HOME/.local/lib64:$LD_LIBRARY_PATH"

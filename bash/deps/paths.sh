# python
PATH_ENTRIES="$HOME/venv/bin"

# rust
PATH_ENTRIES+=" $HOME/.cargo/bin"
PATH_ENTRIES+=" /usr/local/toolchains/rust/cargo/bin"

# node
PATH_ENTRIES+=" $HOME/.npm-packages/bin"

# toolchains
PATH_ENTRIES+=" $HOME/gcc-arm-none-eabi/bin"

# add entries to path and export
for ENTRY in $PATH_ENTRIES
do
	PATH+=":$ENTRY"
done

LOCAL=$HOME/.local
export PATH="$HOME/bin:$LOCAL/bin:$PATH"

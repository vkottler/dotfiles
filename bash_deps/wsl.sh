# export BROWSER="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"
export BROWSER="$HOME/bin/wsl_browser.sh"

# https://github.com/rust-lang/rustup/issues/2206
export RDOC_LOC=`rustup doc --path`
alias rdoc='"$BROWSER" `wslpath -w $RDOC_LOC`'

# make it so we always start in our home directory
if [ ! -n "$WSL_FIRST_LOAD" ]; then
	export WSL_FIRST_LOAD=no
	cd $HOME

	# show motd
	if [ -d /etc/update-motd.d ] && [ ! -n "$SSH_CLIENT" ] && [ ! -n "$SSH_TTY" ]; then
		for i in /etc/update-motd.d/*; do
			$i
		done
	fi
fi

export PROMPT_COMMAND='echo -e -n "\x1b[\x35 q"'

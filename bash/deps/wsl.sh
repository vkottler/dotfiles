# export BROWSER="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"
export BROWSER="$HOME/bin/wsl_browser.sh"

if command -v rustup >/dev/null; then
    # https://github.com/rust-lang/rustup/issues/2206
    export RDOC_LOC=`rustup doc --path`
    alias rdocs='"$BROWSER" `wslpath -w $RDOC_LOC`'
fi

# make it so we always start in our home directory
if [ ! -n "$WSL_FIRST_LOAD" ]; then
	export WSL_FIRST_LOAD=no
	cd $HOME

	# things to do if we're not an ssh session
	if [ ! -n "$SSH_CLIENT" ] && [ ! -n "$SSH_TTY" ]; then
		# start sshd (idempotent), commented out for now because
		# apparently windows-native runs an ssh daemon, wtf?
		#sudo /etc/init.d/ssh start

		# show motd
		if [ -d /etc/update-motd.d ]; then
			for i in /etc/update-motd.d/*; do
				$i
			done
		fi
	fi
fi

export PROMPT_COMMAND='echo -e -n "\x1b[\x35 q"'

# useful variables
export WIN_HOME=/mnt/c/Users/vkottler
export APP_DATA=$WIN_HOME/AppData

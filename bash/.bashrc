# Settings for bash. Only load this once.
if [ "$BASHRC_LOADED" ]; then
	return
fi
export BASHRC_LOADED=1

# alias definitions
if [ -s ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# source includes
if [ -d ~/.bash_includes ]; then
	for i in ~/.bash_includes/*.sh; do
		if [ -r "$i" ]; then
			. "$i"
		fi
	done
	unset i
fi

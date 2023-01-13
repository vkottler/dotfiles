# alias definitions
if [ -f ~/.bash_aliases ]; then
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

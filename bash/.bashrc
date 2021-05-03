# alias definitions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# source includes
if [ -d ~/.bash_includes ]; then
	for i in ~/.bash_includes/*.sh; do
		if [ -r $i ]; then
			. $i
		fi
	done
	unset i
fi

# fix path variable
# this is stolen: https://unix.stackexchange.com/questions/40749/remove-duplicate-path-entries-with-awk-command/149054#149054
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

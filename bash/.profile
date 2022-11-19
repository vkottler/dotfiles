# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# source a profile in .local if one exists
if [ -f "$HOME/.local/.profile" ]; then
	. "$HOME/.local/.profile"
fi

# Fix path variables.
# this is stolen: https://unix.stackexchange.com/questions/40749/remove-duplicate-path-entries-with-awk-command/149054#149054
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
LD_LIBRARY_PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{LD_LIBRARY_PATH}))')"

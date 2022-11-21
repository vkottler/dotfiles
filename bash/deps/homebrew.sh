export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar";
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX";
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin${PATH+:$PATH}";
export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}";

# Load bash completions.
if [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
    . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
fi

# Load bash-completions for git.
THIRD_PARTY=$HOME/third-party
if [ -r "$THIRD_PARTY/git/contrib/completion/git-completion.bash" ]; then
	. "$THIRD_PARTY/git/contrib/completion/git-completion.bash"
fi

DEFAULT_PYTHON=3.9
export PYTHON_VERSION=$DEFAULT_PYTHON

# Add Python installation to path.
export PATH="$HOMEBREW_PREFIX/opt/python@$PYTHON_VERSION/libexec/bin:$PATH";

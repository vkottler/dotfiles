# if not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# if set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

color_prompt=

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# we have color support; assume it's compliant with ecma-48
	# (iso/iec-6429) (lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
fi

# adding git branch to prompt
_parse_git_branch() {
	$(which git) branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
parse_git_branch() {
	OUTPUT=$(_parse_git_branch)
	LENGTH=${#OUTPUT}
	if [ "$LENGTH" -ne 0 ]; then
		printf " %s " "$OUTPUT"
	fi
}

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]$(parse_git_branch)\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*)
	;;
esac

# colored gcc warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# generally enable colors for terminals
export CLICOLOR=1
export COLORTERM=1

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc)
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Set a sane default for Python.
if [ -z "$DEFAULT_PYTHON" ]; then
    DEFAULT_PYTHON=3.10
fi

# Set some things if we're on a deprecated platform.
if command -v lsb_release >/dev/null; then
	if lsb_release -r | grep 16.04 >/dev/null 2>&1 ; then
		export PYTHON_VERSION=3.7
		alias python='python$PYTHON_VERSION'
	elif lsb_release -r | grep 20.04 >/dev/null 2>&1 ; then
		export PYTHON_VERSION=3.8
		alias python='python$PYTHON_VERSION'
	fi
fi

if [ -z "$PYTHON_VERSION" ]; then
	export PYTHON_VERSION=$DEFAULT_PYTHON
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

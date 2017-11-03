
###############################################################################
#                 Settings from Vaughn's .bashrc on GitHub                    #
###############################################################################
# aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cls='clear && ls'
alias vime='vim +Explore'

# git editor settings
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR=vim

# adding git branch to prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# Add the following to the PS1 declaration
# \[\033[33m\]$(parse_git_branch)
###############################################################################


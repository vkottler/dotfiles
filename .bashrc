# .bashrc

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cls='clear && ls'
alias mbed='python ./.local/lib/python2.7/site-packages/mbed/mbed.py'

export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$(getconf PATH)
export GIT_EDITOR=vim


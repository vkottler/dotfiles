# .bashrc

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias svn='svn --no-auth-cache' 
alias xes_cc_e500v2='/opt/bin/devkit/xes_cc_e500v2_setup.sh'
alias xes_cc_e500mc='/opt/bin/devkit/xes_cc_e500mc_setup.sh'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


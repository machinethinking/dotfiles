# .bashrc

# User specific aliases and functions
export SVN_EDITOR=vim
export EDITOR=vim

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH=$PATH:~/bin

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then

    if [ `uname -s` != "Darwin" ]; then
        eval "`dircolors -b`"
	alias ls='ls --color=auto'
    else
	alias ls='ls -G'
    fi

    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

shopt -s cdable_vars

init="/etc/init.d"

# source /etc/bash_completion, if possible
if [ -f  /etc/bash_completion ] ; then
    . /etc/bash_completion
fi

# some more ls aliases
alias ll='ls -ltrah'
alias l='ls -CF'
alias more='less'
alias svnu='svn update'
alias sc='svn commit'
alias psg='ps auxwww | grep'
alias keyremove='ssh-keygen -R $1'
alias showpush='echo \"sudo env SSH_AUTH_SOCK=$SSH_AUTH_SOCK pushProduction -t tags/\"'
alias dssh=kssh
#alias dssh='ssh -A -o StrictHostKeyChecking=no -l root'
alias pdebuilder='pdebuild --debsign-k 01864356 --auto-debsign --buildresult ~/build-area --debbuildopts "-sa -i.git"'
alias sb='source ~/.bashrc'
alias localip='hostname -i'
alias fg='find . | grep -i'
alias watch='watch -n 5 -d'
alias u='cd ..'
alias lasttag='git describe --tags --abbrev=0'
alias simplebuild='pdebuild --debbuildopts "-i.git -sa"'
alias screen='TERM=screen screen '
alias lasttag='git describe --tags --abbrev=0'
alias dename="unset PROMPT_COMMAND"
alias psw='ps auxwww'
alias rnc='reset && clear'
alias srx='screen -r -x'
alias grep='grep --color'
alias mksrc='git clone ssh://minsk.dreamhost.com/home/wfrancis/git/src.git'

function rname() { export PROMPT_COMMAND=$1 ;}
function kssh() { scp ~/.bashrc root@$1:/tmp/.bashrc-wfrancis ; ssh -A -o StrictHostKeyChecking=no -t root@$1 "/bin/bash --rcfile /tmp/.bashrc-wfrancis" ;}
function mcdir() { if [ ! -d "$1" ]; then mkdir -p "$1" ; fi ; cd "$1" ;}
function bgrep() { grep "$1" ~/.bashrc ;}

# screen c-a M monitor c-a _ monitor for silence

# Set screen window title
case "$TERM" in
screen)
  PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
  ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

# make sure there is an ssh key that might work 
if [ -f ~/.ssh/id_dsa ]; then
    svn up
fi

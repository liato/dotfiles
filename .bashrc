# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Define a few Color's 
BLACK='\e[0;30m' 
BLUE='\e[0;34m' 
GREEN='\e[0;32m' 
CYAN='\e[0;36m' 
RED='\e[0;31m' 
PURPLE='\e[0;35m' 
BROWN='\e[0;33m' 
LIGHTGRAY='\e[0;37m' 
DARKGRAY='\e[1;30m' 
LIGHTBLUE='\e[1;34m' 
LIGHTGREEN='\e[1;32m' 
LIGHTCYAN='\e[1;36m' 
LIGHTRED='\e[1;31m' 
LIGHTPURPLE='\e[1;35m' 
YELLOW='\e[1;33m' 
WHITE='\e[1;37m' 
NC='\e[0m'              # No Color

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
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
PS1="[\u@\h:\w]$ "


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

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

alias nd='ls -t -r -x'
alias bw='bwm-ng -I eth1'
alias h='cd ~'
alias df='df -H'
alias myip='lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk "{ print $4 }" | sed "/^$/d; s/^[ ]*//g; s/[ ]*$//g"'
alias cd..='cd ..'
alias home='cd ~'
ds () { du -hs "$@" ; }
dm () { 
  until [ 6 -eq 9 ]; do
#   clear;
    du -hs "$@";
    sleep 1;
  done
}

sfv () { cksfv -i -f *.sfv ; }

miso () {
  if [ -f "$@" ] ; then
    sudo echo Unmounting /media/iso...
    sudo umount /media/iso
    echo Mounting "$@"...
    sudo mount -o loop "$@" /media/iso
    echo Image mounted to /media/iso
  else
    echo "$@" is not a file.
  fi
}

########## Autocompletion stuff ###########
bind 'set completion-ignore-case on'
bind '"\t":menu-complete'
#bind '"\C-y":"\M--\C-i"'
bind '"\e[Z":"\e-1\C-i"'
###########################################


ex () { 
    if [ -f $1 ] ; then 
        case $1 in 
            *.tar.bz2)   tar xjf $1        ;; 
            *.tar.gz)    tar xzf $1     ;; 
            *.bz2)       bunzip2 $1       ;; 
            *.rar)       rar x $1     ;; 
            *.gz)        gunzip $1     ;; 
            *.tar)       tar xf $1        ;; 
            *.tbz2)      tar xjf $1      ;; 
            *.tgz)       tar xzf $1       ;; 
            *.zip)       unzip $1     ;; 
            *.Z)         uncompress $1  ;; 
            *.7z)        7z x $1    ;; 
            *)           echo "'$1' cannot be extracted via extract()" ;; 
        esac 
    else 
        echo "'$1' is not a valid file" 
    fi 
}

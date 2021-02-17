# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[0;34m\]\w\[\033[00m\]\n$ \[\033[31m\]→ \[\033[36m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac


if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# ------------------------------------------------
#                   options
# ------------------------------------------------

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# minor errors in the spelling of a directory component in a 
# cd command will be corrected. The errors checked for are 
# transposed characters, a missing character, and a character too many. 
# If a correction is found, the corrected path is printed, 
# and the command proceeds. This option is only used by interactive shells. 
shopt -s cdspell

# If set, Bash attempts spelling correction on directory names during 
# word completion if the directory name initially supplied does not exist. 
shopt -s dirspell

# set input mode to vi style
set -o vi


# ------------------------------------------------
#               envirnonment vars
# ------------------------------------------------

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50
HISTFILESIZE=100

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export EDITOR=nvim

# ------------------------------------------------
#                   aliases
# ------------------------------------------------
alias :q='exit'
alias ZZ='exit'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'

# fixing stupid inteliJ WM error
export _JAVA_AWT_WM_NONREPARENTING=1
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/nik/.sdkman"
[[ -s "/home/nik/.sdkman/bin/sdkman-init.sh" ]] && source "/home/nik/.sdkman/bin/sdkman-init.sh"

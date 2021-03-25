# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

if [ "$EUID" -ne 0 ] 
    then export PS1="\[\033[0;34m\]\w\[\033[00m\]\n$ \[\033[31m\]→ \[\033[36m\]"
    else export PS1="\[\033[0;34m\]\w\[\033[00m\]\n# \[\033[31m\]→ \[\033[36m\]"
fi

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

# dispable ctrl s ctrl q
stty -ixon

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# minor errors in the spelling of a directory component in a 
# cd command will be corrected. 
shopt -s cdspell

# If set, Bash attempts spelling correction on directory names during 
# word completion if the directory name initially supplied does not exist. 
shopt -s dirspell

# automaticly change dir
shopt -s autocd
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
export BROWSER="firefox '%s' &"

# fixing stupid inteliJ WM error
export _JAVA_AWT_WM_NONREPARENTING=1

# extend path
export PATH=$PATH:~/scripts/

# ------------------------------------------------
#               archive extractor
# ------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1       ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# ------------------------------------------------
#                   aliases
# ------------------------------------------------
alias :q='exit'
alias ZZ='exit'
alias ls='ls --color=auto -hN --group-directories-first'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'

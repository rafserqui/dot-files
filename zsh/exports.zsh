#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export PATH="$HOME/.local/bin":$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rafserqui/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rafserqui/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rafserqui/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rafserqui/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
PATH=/usr/local/texlive/2022/bin/x86_64-linux:$PATH
export PATH="$PATH:/home/rafserqui/julia-1.8.0/bin"

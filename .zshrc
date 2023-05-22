#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.config/zsh/.zsh_history

# Source
plug "$HOME/.config/zsh/exports.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

export PATH="$HOME/.local/bin":$PATH

# autocomplete fix case
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Replace cat with bat
alias cat="batcat"

# Replace ls with lsd
alias -g ls="lsd"

# Neovim appimage
alias -g nvim="nvim.appimage"

# Change color of (o+w) directories
eval "$(dircolors ~/.config/lsd/.dircolors)"

# Python alias
alias -g python=python3

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



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
# eval "$(dircolors ~/.config/lsd/.dircolors)"
export LS_COLORS="$(vivid generate snazzy)"

# >>> juliaup initialize >>>

# ! Contents within this block are managed by juliaup !!

path('/home/rafserqui/.juliaup/bin/' $path)
export PATH

# <<< juliaup initialize <<<

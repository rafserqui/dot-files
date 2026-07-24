# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# history
HISTFILE=~/.config/zsh/.zsh_history

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

export PATH="$HOME/.local/bin":$PATH

# NVM manager
export NVM_LAZY_LOAD=true
plug "lukechilds/zsh-nvm"

# autocomplete fix case
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Add alias for lvim
alias -g lvim="NVIM_APPNAME=lvim $HOME/Downloads/nvim-linux-x86_64.appimage"

# Add alias for bat and lsd
alias cat="bat"
alias ls="lsd"

# Themes for bat and lsd
export BAT_THEME="gruvbox-dark"
export LS_COLORS="$(vivid generate rose-pine-dawn)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Layout options for fzf
export FZF_DEFAULT_OPTS="--style full --border"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}' --bind 'focus:transform-header:file --brief {}'"


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/rafserqui/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
# TeX Live
export PATH=/usr/local/texlive/2026/bin/x86_64-linux:$PATH

# Matlab
export PATH=/usr/local/MATLAB/R2025b/bin:$PATH

# Anaconda
export PATH=/home/rafserqui/anaconda3/bin:$PATH

# Yazi --- file manager config
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Alias for spotify fix
alias spotify_cache="rm -r ~/.var/app/com.spotify.Client/cache/spotify"
alias spotify_user="rm -r ~/.var/app/com.spotify.Client/config/spotify"

# Alias for turning off laptop screen
alias toggle='swaymsg output eDP-1 toggle' 

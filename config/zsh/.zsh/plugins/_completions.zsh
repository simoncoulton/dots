autoload -Uz compinit && compinit

FPATH=${ZSH_PLUGINS_DIR}/zsh-completions:$FPATH

# If zsh complains on MacOS, run the following
# compaudit | xargs chmod g-w

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
if command -v brew &>/dev/null; then
  export ZSH_PLUGINS_DIR=$(brew --prefix)/share/
else
  export ZSH_PLUGINS_DIR="/usr/share/zsh/plugins"
fi

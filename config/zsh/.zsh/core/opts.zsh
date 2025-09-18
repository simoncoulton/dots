setopt auto_cd

HISTFILE=~/.zsh_history   # where to save history
HISTSIZE=1000            # number of commands kept in memory
SAVEHIST=1000            # number of commands saved to file

setopt APPEND_HISTORY     # append to the history file, don’t overwrite
setopt INC_APPEND_HISTORY # save each command right after execution
setopt HIST_IGNORE_DUPS   # ignore duplicates
setopt HIST_IGNORE_SPACE  # ignore commands starting with space


autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

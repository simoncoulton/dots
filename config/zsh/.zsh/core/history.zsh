HISTFILE=~/.zsh_history   # where to save history
HISTSIZE=5000            # number of commands kept in memory
SAVEHIST=$HISTSIZE            # number of commands saved to file
DISTDUP=erase

setopt APPEND_HISTORY     # append to the history file, don’t overwrite
setopt INC_APPEND_HISTORY # save each command right after execution
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS   # ignore duplicates
setopt HIST_IGNORE_SPACE  # ignore commands starting with space
setopt HIST_IGNORE_ALLDUPS  # ignore commands starting with space

<<<<<<< Updated upstream
bindkey -v # use vim key bindings

export KEYTIMEOUT=1

bindkey '^[[H' beginning-of-line    # Home
bindkey '^[[F' end-of-line          # End
bindkey '^[OH' beginning-of-line    # Alternative Home
bindkey '^[OF' end-of-line          # Alternative End
=======
bindkey -e # use emacs key bindings

bindkey -M emacs '^[[3~' delete-char
bindkey -M emacs '^[[H' beginning-of-line
bindkey -M emacs '^[[F' end-of-line
>>>>>>> Stashed changes

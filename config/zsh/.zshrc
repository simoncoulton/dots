export ZSH="${ZDOTDIR:-$HOME}/.zsh"

local includes=("core" "aliases" "exports" "hooks" "plugins")

for f in "${includes[@]}"; do
    local zsh_source="$ZSH/$f"
    for f in $(find -L "$zsh_source" -maxdepth 1 -type f -name \*.zsh) ; do
        source "$f"
    done 
done

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/simoncoulton/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/simoncoulton/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


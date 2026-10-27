#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$SCRIPT_DIR/../config"

cd "$CONFIG_DIR" || exit 1

if [ -n "$1" ]; then
    configs=("$1")
else
    configs=()
    for dir in "$CONFIG_DIR"/*/; do
        [ -d "$dir" ] || continue
        configs+=("$(basename "$dir")")
    done
fi

for config in "${configs[@]}"; do
    echo "Stow'ing $config..."
    stow -t ~/ "$config" || exit 1
done

if command -v bat >/dev/null 2>&1; then
    echo "Building bat cache..."
    bat cache --build >/dev/null 2>&1
fi

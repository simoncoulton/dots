#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CURRENT_DIR=$(pwd)
CONFIG_DIR=$SCRIPT_DIR/../config

cd $CONFIG_DIR

for dir in "$CONFIG_DIR"/*/; do
    if [ -d "$dir" ]; then
        dir_name=$(basename "$dir")
        echo "Stow'ing $dir_name..."
        stow -t ~/ $dir_name
        
    fi

done
cd $CURRENT_DIR

bat cache --build
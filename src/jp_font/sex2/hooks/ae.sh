#!/usr/bin/env bash

mkdir -p textures2

for file in "$@"; do
    dir=$(dirname "$file")

    grep '#include' "$file" | while read -r line; do
        # extract include path
        inc=$(echo "$line" | sed -nE 's/.*#include[[:space:]]*["<]([^">]+)[">].*/\1/p')
        [ -z "$inc" ] && continue

        # if it's .inc.c → convert to .png path
        if [[ "$inc" == *.inc.c ]]; then
            inc="${inc%.inc.c}.png"
        fi

        full="$dir/$inc"

        echo "Checking: $full"

        if [ -f "$full" ]; then
            echo "Copying $full"
            cp "$full" textures2/
        else
            echo "Missing: $full"
        fi
    done
done

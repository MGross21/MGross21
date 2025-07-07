#!/bin/bash

# Ensure script is run from the 'covers' directory
if [[ $(basename "$(realpath $(pwd))") != "MGross21" ]]; then
    echo "Error: Run this script from the 'MGross21' directory."
    exit 1
fi

cd covers || { echo "Error: 'covers' directory not found."; exit 1; }

# Compile and ripple render
find . -name "*.tex" | while read -r texfile; do
    subfolder=$(dirname "$texfile")
    latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir="$subfolder" "$texfile" ${silent:+&> /dev/null} && \
    latexmk -c -outdir="$subfolder" && \
    echo "Compiled $texfile in $subfolder" || \
    echo "Failed to compile $texfile"
    latexmk -c -outdir="$subfolder" # Cleanup auxiliary files
    [[ $? -eq 0 ]] && (cd "../" && ./render.sh)
done


# USAGE:
# chmod +x render_covers.sh
# ./render_covers.sh
# OR
# ./render_covers.sh -s # **Silent**
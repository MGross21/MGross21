#!/bin/bash

# Ensure script is run from the 'covers' directory
if [[ $(basename "$(realpath $(pwd))") != "covers" ]]; then
    echo "Error: Run this script from the 'covers' directory."
    exit 1
fi

# Compile and ripple render
find . -name "*.tex" | while read -r texfile; do
    subfolder=$(dirname "$texfile")
    latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir="$subfolder" "$texfile" ${silent:+&> /dev/null} && \
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
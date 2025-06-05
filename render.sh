#!/bin/bash

# This script compiles LaTeX files to PDF using latexmk.
# It assumes that latexmk is installed and available in the PATH.

# Make Output Directory
if [[ $(pwd) != */MGross21 ]]; then
    echo "Error: Run this script from the MGross21 directory."
    exit 1
fi

mkdir output

# Compile LaTeX files to PDF
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=output resume.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=output cv.tex

# Clean up auxiliary files
latexmk -c -outdir=output

# USAGE:
# chmod +x render.sh
# ./render.sh 
# OR
# ./render.sh >> /dev/null 2>&1 # **Silent**
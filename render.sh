#!/bin/bash

# This script compiles LaTeX files to PDF using latexmk.
# It assumes that latexmk is installed and available in the PATH.

# Make Output Directory
mkdir -p output

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
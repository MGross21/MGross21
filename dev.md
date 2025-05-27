# Local Development

## Install Required Packages
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended latexmk
```

# Refresh Rendered Documents
```bash
mkdir -p output
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=output resume.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=output cv.tex
latexmk -c -outdir=output
 ```
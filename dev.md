# Local Development

## Install Required Packages
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended latexmk
```

# Refresh Rendered Documents
```bash
latexmk -pdf -outdir=output resume.tex -f -silent >> /dev/null;  latexmk -pdf -outdir=output cv.tex -f -silent >> /dev/null; rm output/*.{aux,fdb*,fls,log,out}
 ```
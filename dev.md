# Local Development

This workflow uses Ubuntu/Debian Packages (WSL)

## Install Required Packages

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended latexmk
sudo apt install -y evince # PDF Viewer
```

## Setup Bash Script

```bash
chmod +x ./render.sh
```

## Refresh Rendered Documents

```bash
./render.sh >> /dev/null && clear
```

## Preview Externally

If not directly available via IDE:

```bash
evince output/*.pdf
```
# Local Development

## LaTeX

This workflow uses Ubuntu/Debian Packages (WSL).

### Install Required Packages

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y texlive-{latex-{recommended,extra},fonts-recommended} latexmk
```

### Setup Bash Script

```bash
chmod +x ./render.sh
```

### Refresh Rendered Documents

```bash
./render.sh >> /dev/null && clear
```

### Preview Externally

If not directly available via IDE, download external PDF viewer:

```bash
sudo apt install -y evince
```

```bash
evince output/*.pdf
```

## Typst

### Install Required Packages

```bash
cargo install typst-cli
```

### Render

```bash
typst compile resume.typ output/resume.pdf
```

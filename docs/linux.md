# Linux/macOS Setup

`linkdir` is a Bash script located at `bin/linkdir`.

## Requirements

- Bash 4+
- Common CLI tools: `awk`, `grep`, `sed`, `cut`
- Optional: `column`, `fzf`

## Install With Make

```bash
make check
make install
make install-completion
```

Default install paths:

- `~/.local/bin/linkdir`
- `~/.local/share/bash-completion/completions/linkdir`

Override paths:

```bash
make install PREFIX="$HOME/bin"
make install-completion BASH_COMPLETION_DIR="$HOME/.bash_completion.d"
```

## Manual Install

```bash
chmod +x bin/linkdir
mkdir -p "$HOME/bin"
cp bin/linkdir "$HOME/bin/linkdir"
```

Ensure `~/bin` is in your `PATH`.

## Bash Completion

```bash
source /absolute/path/to/completions/linkdir-completion.bash
```

Add that line to `.bashrc` to load it automatically.

## Directory Navigation Helper

An executable cannot change the parent shell's current directory.
Use this helper in `.bashrc`:

```bash
lgo() { cd "$(linkdir path "$1")"; }
```

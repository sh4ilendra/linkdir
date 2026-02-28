# linkdir

`linkdir` is a lightweight Bash bookmark utility for storing and opening shortcuts to URLs, directories, and shell commands.

Mappings are stored as:

```text
key|value
```

in:

```text
~/.config/linkdir/links.db
```

(or `$XDG_CONFIG_HOME/linkdir/links.db` when set).

## Features

- Add, overwrite, list, and remove mappings
- Open URL mappings with `xdg-open` in background
- Detect directory mappings and print resolved path
- Execute command mappings
- Atomic persistence writes
- Optional fuzzy open with `fzf`
- Bash completion for commands and stored keys

## Requirements

- Bash 4+
- Common CLI tools (`awk`, `grep`, `sed`, `cut`)
- Optional: `column`, `fzf`, `xdg-open`

## Installation

### With Make (recommended)

```bash
make check
make install
make install-completion
```

By default this installs to:

- `~/.local/bin/linkdir`
- `~/.local/share/bash-completion/completions/linkdir`

You can override paths:

```bash
make install PREFIX="$HOME/bin"
make install-completion BASH_COMPLETION_DIR="$HOME/.bash_completion.d"
```

### Manual

1. Make the script executable:

```bash
chmod +x linkdir
```

2. Put it on your `PATH` (example):

```bash
mkdir -p "$HOME/bin"
cp linkdir "$HOME/bin/linkdir"
```

3. Ensure `~/bin` is in `PATH` in your shell profile.

## Commands

```bash
linkdir add <key> <value>
linkdir open <key>
linkdir path <key>
linkdir list
linkdir remove <key>
linkdir f
linkdir help
```

## Examples

```bash
linkdir add gh https://github.com
linkdir add proj ~/workspace/project
linkdir add docs "xdg-open https://example.com/docs"

linkdir list
linkdir open gh
linkdir open docs
```

## Directory Navigation

A standalone executable cannot change the parent shell's current directory.

Use the helper function below in `.bashrc`:

```bash
lgo() { cd "$(linkdir path "$1")"; }
```

Then:

```bash
lgo proj
```

## Bash Completion

Source the completion script:

```bash
source /absolute/path/to/linkdir-completion.bash
```

To load on every shell startup, add that line to `.bashrc`.

## Notes

- Keys allow: letters, numbers, `.`, `_`, `-`
- Re-adding an existing key overwrites it safely
- `linkdir f` requires `fzf`; otherwise a friendly message is shown

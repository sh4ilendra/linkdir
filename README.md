# linkdir

`linkdir` is a lightweight Bash bookmark utility for storing and opening shortcuts to URLs, directories, and shell commands.

## Platform Support

- Primary: Bash utility for Linux/macOS and Unix-like shells.
- Windows: supported through wrappers in `platform/windows/` and via Git Bash/WSL.
- `make install` on Windows is supported in Unix-like environments (Git Bash/MSYS2/WSL), not plain PowerShell/CMD alone.

Mappings are stored as `key|value` in:

- `~/.config/linkdir/links.db`
- or `$XDG_CONFIG_HOME/linkdir/links.db` when set

## Features

- Add, overwrite, list, and remove mappings
- Open URL mappings in the background
- Detect directory mappings and print resolved path
- Execute command mappings
- Atomic persistence writes
- Optional fuzzy open with `fzf`
- Bash completion for commands and stored keys

## Quick Start

```bash
chmod +x bin/linkdir
./bin/linkdir add gh https://github.com
./bin/linkdir list
./bin/linkdir open gh
```

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

## Platform Docs

- Linux/macOS setup: `docs/linux.md`
- Windows setup (PowerShell/CMD): `docs/windows.md`

## Project Structure

```text
bin/                  # main executable
completions/          # shell completion scripts
platform/windows/     # Windows launchers
docs/                 # platform-specific documentation
```

## Notes

- Keys allow: letters, numbers, `.`, `_`, `-`
- Re-adding an existing key overwrites it safely
- `linkdir f` requires `fzf`; otherwise a friendly message is shown
- URL opening supports Linux (`xdg-open`), macOS (`open`), and Windows (`cmd.exe /c start`)

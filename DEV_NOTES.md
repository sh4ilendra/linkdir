# DEV Notes

## WSL (Ubuntu) Installation

Run from WSL (Ubuntu) shell:

```bash
sudo apt update
sudo apt install -y bash make sqlite3 gawk coreutils
sudo apt install -y fzf bsdmainutils xdg-utils
```

Project setup and install:

```bash
cd /path/to/linkdir
make check
make install
make install-completion
```

Ensure binary + completion are loaded:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
echo 'source "$HOME/.local/share/bash-completion/completions/linkdir"' >> ~/.bashrc
source ~/.bashrc
```

Quick smoke test:

```bash
linkdir add gh https://github.com
linkdir list
linkdir open gh
```

## Verify SQLite Data

Find DB path used by `linkdir`:

```bash
DB="${XDG_CONFIG_HOME:-$HOME/.config}/linkdir/links.db"
echo "$DB"
```

Confirm DB is SQLite:

```bash
file "$DB"
```

List tables:

```bash
sqlite3 "$DB" ".tables"
```

Inspect mappings table:

```bash
sqlite3 "$DB" "SELECT key, value, created_at, updated_at FROM mappings ORDER BY key;"
```

Count mappings:

```bash
sqlite3 "$DB" "SELECT COUNT(*) FROM mappings;"
```

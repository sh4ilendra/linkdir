# Windows Setup

Windows support is provided through launchers in `platform/windows/`:

- `platform/windows/linkdir.cmd`
- `platform/windows/linkdir.ps1`

Both launchers call the Bash script at `bin/linkdir`.

## Requirements

- A `bash` executable in `PATH` (Git Bash or WSL bash)

## Run From Repository Root

```powershell
.\platform\windows\linkdir.cmd help
.\platform\windows\linkdir.ps1 list
```

## Run Globally

Add `platform\windows` to your user `PATH`:

```powershell
$repo = "C:\path\to\linkdir\platform\windows"
[Environment]::SetEnvironmentVariable(
  "Path",
  $env:Path + ";" + $repo,
  "User"
)
```

Open a new terminal, then run:

```powershell
linkdir help
```

## Notes

- If `bash` is missing, launchers return an error with install guidance.
- URL opening supports Windows via `cmd.exe /c start`.

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Resolve-Path (Join-Path $scriptDir "..\..")
$bash = Get-Command bash -ErrorAction SilentlyContinue
if (-not $bash) {
  Write-Error "bash was not found in PATH. Install Git Bash or WSL bash and try again."
  exit 1
}

Push-Location $repoRoot
try {
  & $bash.Source "./bin/linkdir" @args
  exit $LASTEXITCODE
} finally {
  Pop-Location
}

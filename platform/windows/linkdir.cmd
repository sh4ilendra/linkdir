@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "REPO_ROOT=%SCRIPT_DIR%..\..\"
where bash >nul 2>&1
if errorlevel 1 (
  echo bash was not found in PATH. Install Git Bash or WSL bash and try again. 1>&2
  exit /b 1
)

pushd "%REPO_ROOT%" >nul
bash "./bin/linkdir" %*
set "EXIT_CODE=%ERRORLEVEL%"
popd >nul
exit /b %EXIT_CODE%

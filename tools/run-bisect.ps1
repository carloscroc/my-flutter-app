#!/usr/bin/env powershell
<#
tools/run-bisect.ps1
Simple runner for `git bisect` that marks HEAD as bad and a known-good ref as good,
then uses `tools/check-good.ps1` to test each commit. Run from repository root.

Usage:
  .\tools\run-bisect.ps1 -Good main
  .\tools\run-bisect.ps1 -Good <good-commit-hash>
#>

Param(
    [string]$Good = "main",
    [string]$TestScript = ".\tools\check-good.ps1"
)

Write-Output "[run-bisect] Starting git bisect; marking HEAD as bad and '$Good' as good..."

git bisect start
git bisect bad
git bisect good $Good

Write-Output "[run-bisect] Running: git bisect run powershell -File $TestScript"
git bisect run powershell -File $TestScript

$exit = $LASTEXITCODE
if ($exit -eq 0) {
    Write-Output "[run-bisect] git bisect finished — first bad commit printed above by git."
} else {
    Write-Output "[run-bisect] git bisect ended with exit code $exit. Check output for clues."
}

Write-Output "[run-bisect] Resetting bisect state..."
git bisect reset

Write-Output "[run-bisect] Done."

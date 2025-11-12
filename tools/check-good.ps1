#!/usr/bin/env powershell
<#
tools/check-good.ps1
Exit code 0 = good (no regression), 1 = bad (regression).
This script runs a small set of Flutter checks: `flutter pub get`, `flutter analyze`, and `flutter test`.
It is intended to be used by `git bisect run` on Windows PowerShell.
#>
Write-Output "[check-good] Running 'flutter pub get'..."
flutter pub get
if ($LASTEXITCODE -ne 0) {
    Write-Output "[check-good] 'flutter pub get' failed (exit $LASTEXITCODE)."
    exit 1
}

Write-Output "[check-good] Running 'flutter analyze'..."
flutter analyze
if ($LASTEXITCODE -ne 0) {
    Write-Output "[check-good] 'flutter analyze' failed (exit $LASTEXITCODE)."
    exit 1
}

Write-Output "[check-good] Running 'flutter test'..."
flutter test
if ($LASTEXITCODE -ne 0) {
    Write-Output "[check-good] 'flutter test' failed (exit $LASTEXITCODE)."
    exit 1
}

# Optional: uncomment to include a lightweight build as an additional check
# Write-Output "[check-good] Running 'flutter build apk --debug'..."
# flutter build apk --debug
# if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Output "[check-good] All checks passed."
exit 0

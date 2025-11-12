<#
collect_diagnostics.ps1

Creates a `diagnostics/` folder (if missing) and runs a set of Flutter/Gradle/Java environment commands
redirecting verbose output into files under `diagnostics/` for sharing and analysis.

Usage:
  # from repo root (Windows PowerShell)
  .\scripts\collect_diagnostics.ps1

  # include `flutter run -v` (interactive) - optional
  .\scripts\collect_diagnostics.ps1 -RunFlutterRun

This script intentionally does not fail on first error; it collects outputs for later inspection.
#>

param(
    [switch]$RunFlutterRun
)

Set-StrictMode -Version Latest

$root = Get-Location
$diagnosticsDir = Join-Path -Path $root -ChildPath "diagnostics"
if (-not (Test-Path -Path $diagnosticsDir)) {
    New-Item -ItemType Directory -Path $diagnosticsDir | Out-Null
}

function Append-Summary($text) {
    $file = Join-Path $diagnosticsDir "summary.txt"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "[$timestamp] $text" | Out-File -FilePath $file -Append -Encoding utf8
}

Append-Summary "Starting diagnostics run from: $root"

Write-Host "Running: flutter --version and flutter doctor -v"
& flutter --version *> (Join-Path $diagnosticsDir "flutter_version.txt")
Append-Summary "flutter --version exit=$LASTEXITCODE"

& flutter doctor -v *> (Join-Path $diagnosticsDir "flutter_doctor.txt")
Append-Summary "flutter doctor -v exit=$LASTEXITCODE"

Write-Host "Running: flutter pub get --verbose"
& flutter pub get --verbose *> (Join-Path $diagnosticsDir "flutter_pub_get_verbose.txt")
Append-Summary "flutter pub get --verbose exit=$LASTEXITCODE"

Write-Host "Cleaning project and removing build/"
& flutter clean *> (Join-Path $diagnosticsDir "flutter_clean.txt")
Append-Summary "flutter clean exit=$LASTEXITCODE"

if (Test-Path -Path (Join-Path $root "build")) {
    try {
        Remove-Item -Recurse -Force (Join-Path $root "build") -ErrorAction Stop
        Append-Summary "Removed build/ directory"
    } catch {
        Append-Summary "Failed to remove build/: $($_.Exception.Message)"
    }
}

Write-Host "Running: flutter pub get --verbose (after clean)"
& flutter pub get --verbose *> (Join-Path $diagnosticsDir "flutter_pub_get_after_clean.txt")
Append-Summary "flutter pub get (after clean) exit=$LASTEXITCODE"

Write-Host "Collecting Java and PATH environment info"
$env:JAVA_HOME | Out-File -FilePath (Join-Path $diagnosticsDir "java_home.txt") -Encoding utf8
java -version 2>&1 | Out-File -FilePath (Join-Path $diagnosticsDir "java_version.txt") -Encoding utf8
Get-ChildItem Env:Path | Out-File -FilePath (Join-Path $diagnosticsDir "env_path.txt") -Encoding utf8
Append-Summary "Captured JAVA_HOME, java -version, and PATH"

Write-Host "Attempting Flutter build (apk) with verbose logs"
& flutter build apk --verbose *> (Join-Path $diagnosticsDir "flutter_build_apk_verbose.txt")
Append-Summary "flutter build apk exit=$LASTEXITCODE"

if (Test-Path -Path (Join-Path $root "android")) {
    Write-Host "Running Gradle assembleDebug inside android/ (this may take a while)"
    Push-Location (Join-Path $root "android")
    if (Test-Path -Path "./gradlew.bat") {
        .\gradlew.bat assembleDebug --stacktrace --info *> (Join-Path $root "diagnostics\gradle_assemble_debug.txt")
        Append-Summary "gradlew assembleDebug exit=$LASTEXITCODE"
    } else {
        Append-Summary "gradlew.bat not found under android/"
    }
    Pop-Location
} else {
    Append-Summary "android/ folder not found; skipping Gradle assemble"
}

if ($RunFlutterRun) {
    Write-Host "Running: flutter run -v (interactive)"
    Write-Host "Note: this is interactive and may require a connected device/emulator. Use Ctrl+C to stop."
    & flutter run -v *> (Join-Path $diagnosticsDir "flutter_run_verbose.txt")
    Append-Summary "flutter run -v exit=$LASTEXITCODE"
} else {
    Append-Summary "Skipped flutter run -v (pass -RunFlutterRun to enable)"
}

Append-Summary "Diagnostics run complete. Files produced:"
Get-ChildItem -Path $diagnosticsDir | ForEach-Object { Append-Summary " - $($_.Name)" }

Write-Host "Diagnostics complete. See files in: $diagnosticsDir"

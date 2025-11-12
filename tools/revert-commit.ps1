#!/usr/bin/env powershell
<#
tools/revert-commit.ps1
Helper to perform a "safe revert" by creating a WIP branch and running `git revert` for one
or more commits provided by the user. Intended to be run from repository root on Windows PowerShell.

Usage:
  .\tools\revert-commit.ps1 -BadHashes "<bad-hash>"        # single commit
  .\tools\revert-commit.ps1 -BadHashes "<hash1> <hash2>"   # multiple commits (oldest -> newest)
  .\tools\revert-commit.ps1 -BadHashes "<bad-hash>" -RunVerify

Notes:
- Provide commits in chronological order (oldest first) when reverting multiple dependent commits.
- The script creates a branch `revert-wip/<current-branch>-<short-hash>` and attempts to revert.
- If conflicts occur, the script stops and instructs how to resolve them manually.
#>

Param(
    [Parameter(Mandatory=$true)]
    [string]$BadHashes,
    [string]$BranchName,
    [switch]$RunVerify
)

function Exec-Git([string]$args) {
    Write-Output "[git] $args"
    git $args
    return $LASTEXITCODE
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "git is not available in PATH. Run this script from a machine with git installed."
    exit 1
}

$currentBranch = (git rev-parse --abbrev-ref HEAD).Trim()
if ($LASTEXITCODE -ne 0 -or -not $currentBranch) {
    Write-Error "Unable to detect current branch. Ensure you're in a git repository."
    exit 1
}

$badArray = $BadHashes -split '\s+' | Where-Object { $_ -ne '' }
if ($badArray.Count -eq 0) {
    Write-Error "No commit hashes provided in -BadHashes."
    exit 1
}

if (-not $BranchName) {
    $short = $badArray[0].Substring(0, [Math]::Min(7, $badArray[0].Length))
    $safeBranch = "revert-wip/$currentBranch-$short"
} else {
    $safeBranch = $BranchName
}

Write-Output "Creating branch: $safeBranch"
$rc = Exec-Git "checkout -b $safeBranch"
if ($rc -ne 0) {
    Write-Error "Failed to create branch $safeBranch. Aborting."
    exit 1
}

Write-Output "Applying revert(s) for: $($badArray -join ', ')"
foreach ($h in $badArray) {
    Write-Output "Reverting commit $h (no editor)..."
    # Use --no-edit to avoid opening an editor for the revert message
    git revert --no-edit $h
    $rc = $LASTEXITCODE
    if ($rc -ne 0) {
        Write-Output "git revert failed for $h (exit $rc). Likely merge conflicts."
        Write-Output "Resolve conflicts, then run:"
        Write-Output "  git add -A"
        Write-Output "  git commit"
        Write-Output "After resolving, you can continue verification by running:"
        Write-Output "  .\tools\revert-commit.ps1 -BadHashes '$BadHashes' -RunVerify"
        exit 2
    }
}

Write-Output "All revert(s) applied successfully on branch $safeBranch."
Write-Output "Push the branch to remote and open a PR if desired:"
Write-Output "  git push -u origin $safeBranch"

if ($RunVerify) {
    if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
        Write-Output "flutter is not available in PATH; skipping verification steps."
        exit 0
    }
    Write-Output "Running verification: flutter pub get; flutter clean; flutter analyze; flutter test"
    flutter pub get
    flutter clean
    flutter analyze
    if ($LASTEXITCODE -ne 0) { Write-Error "flutter analyze failed."; exit 3 }
    flutter test
    if ($LASTEXITCODE -ne 0) { Write-Error "flutter test failed."; exit 4 }
    Write-Output "Verification passed locally."
}

exit 0

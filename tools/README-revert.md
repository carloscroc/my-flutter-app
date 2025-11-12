# Safe revert helper

This file explains how to perform a safe revert using the included helper script `tools/revert-commit.ps1`.

Purpose
- Create a WIP branch and run `git revert` for one or more commits that introduced a regression.
- Stop and let the user resolve conflicts if any revert fails.

Usage

1. Stash WIP first (optional):

```powershell
git status --porcelain
git stash push -m "wip-before-revert-$(Get-Date -Format yyyyMMddHHmmss)"
```

2. Run the safe revert helper (from repo root). Provide one or more commit hashes (oldest → newest):

```powershell
.\tools\revert-commit.ps1 -BadHashes "<bad-hash>"

# or multiple commits:
.\tools\revert-commit.ps1 -BadHashes "<old-bad-hash> <newer-bad-hash>"

# run and perform verification after revert (-RunVerify)
.\tools\revert-commit.ps1 -BadHashes "<bad-hash>" -RunVerify
```

How it works
- The script creates a branch named `revert-wip/<current-branch>-<short-hash>`.
- It runs `git revert --no-edit` for each provided commit.
- If a revert fails due to conflicts, the script stops and prints instructions to resolve them.

After reverts succeed
- Push the branch and open a PR:

```powershell
git push -u origin revert-wip/<current-branch>-<short-hash>
```

- Run `flutter pub get` and `flutter clean` locally, then `flutter analyze` and `flutter test`.

Conflict resolution
- When a conflict happens, follow these steps:

```powershell
# inspect files
git status
# edit files to resolve conflicts
git add -A
git commit
```

- After resolving, run verification steps:

```powershell
flutter pub get
flutter clean
flutter analyze
flutter test
```

Notes
- If plugin or platform files were part of the revert, you may need to run platform-specific steps (e.g., `pod install` in `ios/` or regenerate Windows build artifacts).
- For large or multiple dependent commits, prefer using `git bisect` first (see `tools/README-bisect.md`).

# Bisect helper tools

This folder contains helper scripts to run a local `git bisect` using PowerShell and Flutter checks.

Files
- `check-good.ps1` — the test script used by `git bisect run`. Exit 0 means the commit is GOOD; exit 1 means BAD.
- `run-bisect.ps1` — convenience wrapper that starts `git bisect`, marks HEAD as bad and a provided ref as good, then runs the test script.

Quick usage (PowerShell, run from repository root)

1. Stash any WIP first:

```powershell
git status --porcelain
git stash push -m "wip-before-bisect-$(Get-Date -Format yyyyMMddHHmmss)"
```

2. Try a quick check at HEAD (optional):

```powershell
flutter pub get
flutter analyze
flutter test
```

3. Run the bisect helper. If `main` is a known-good ref, you can use it; otherwise provide a known-good commit hash.

```powershell
# mark HEAD bad, mark main as good, and run the check script on each bisect step
.\tools\run-bisect.ps1 -Good main

# or with a specific good commit
.\tools\run-bisect.ps1 -Good <good-commit-hash>
```

4. After bisect finishes it will print the first-bad commit. Inspect it with:

```powershell
git show <bad-hash>
git diff <good-hash>..<bad-hash> --name-only
```

5. Revert options (choose one):

- Safe revert (preserves later commits):

```powershell
git checkout -b revert-wip/feature-dashboard-tokens
git revert <bad-hash>
# resolve conflicts, then push or open PR
```

- Reset to known-good commit (destructive; create a snapshot branch first):

```powershell
git branch temp-before-reset
git reset --hard <good-hash>
```

6. After revert/reset regenerate dependencies and verify locally:

```powershell
flutter pub get
flutter clean
flutter analyze
flutter test
flutter run -d windows
```

Notes & troubleshooting
- If the repo relies on platform-generated files (e.g., plugin registrants), run `flutter clean` and rebuild so Flutter regenerates them.
- If plugin versions changed in `pubspec.yaml`, ensure you restore the matching `pubspec.lock` when resetting or revert plugin changes as needed.
- The bisect run will only be as reliable as `check-good.ps1`'s checks; you can extend it to include `flutter build` if necessary.

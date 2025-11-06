Assets folder

- Put images inside `assets/images/`.
- Put icons or SVGs inside `assets/icons/`.

Example usage in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
```

After adding assets, run:

```powershell
flutter pub get
```

Then load an image in Flutter:

```dart
Image.asset('assets/images/my_image.png')
```

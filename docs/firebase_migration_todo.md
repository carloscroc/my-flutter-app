# Firebase Migration TODO

This project currently uses mock authentication and mock data for local development. Replace these mocks with Firebase Auth and Firestore when ready.

Checklist:

- [ ] Add `firebase_core` and platform configuration files (`android/app/google-services.json`, `ios/Runner/GoogleService-Info.plist`).
- [ ] Generate and add `lib/firebase_options.dart` using `flutterfire` CLI.
- [ ] Implement `firestore_auth_repository.dart` replacing `mock_auth_repository.dart` and wire it to `authRepositoryProvider`.
- [ ] Implement `firestore_home_repository.dart` replacing `mock_home_repository.dart` using collection names `workouts` and `meditative_mornings` (confirm schema).
- [ ] Update security rules and enable required Auth methods.
- [ ] Optionally use Firebase Emulator Suite for local testing.

Reminder: provide sample Firestore documents or the collection schema so the repository can map fields precisely. You can also ask the AI to search for any existing backend docs if available.

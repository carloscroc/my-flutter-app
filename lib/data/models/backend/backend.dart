import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseBackend {
  static FirebaseFirestore? _firestore;

  static FirebaseFirestore get firestore {
    _firestore ??= FirebaseFirestore.instance;
    return _firestore!;
  }

  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      // Firebase already initialized or error
      print('Firebase initialization: $e');
    }
  }

  // Collection references
  static CollectionReference get users => firestore.collection('users');
  static CollectionReference get workouts => firestore.collection('workouts');
  static CollectionReference get meditations =>
      firestore.collection('meditations');
}

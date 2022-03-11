import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  static Future<User?> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? user;
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);
      }
      return user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  static User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}

library firebase_service_kit;

import 'package:firebase_core/firebase_core.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_service_kit/service/auth_service.dart';

class FirebaseService {
  static Future<void> initialize({
    String? name,
    FirebaseOptions? options,
  }) async {
    await Firebase.initializeApp(
      name: name,
      options: options,
    );
  }
}

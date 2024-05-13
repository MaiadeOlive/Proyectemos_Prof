import 'package:firebase_auth/firebase_auth.dart';

import '../../providers/google_sign_in_provider.dart';

class LoginController {
  Future<void> login() async {
    final provider = GoogleSignInProvider();
    try {
      await provider.googleLogin();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}

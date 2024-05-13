import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'https://mail.google.com/'
  ]);

  late GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  Future googleLogout() async {
    await auth.signOut();
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}

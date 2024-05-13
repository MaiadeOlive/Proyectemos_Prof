import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/home/home_page.dart';
import '../providers/google_sign_in_provider.dart';
import '../app/login/login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    final currentUser = provider.auth.currentUser;

    setState(() {
      currentUser;
    });

    try {
      if (currentUser == null) {
        return const LoginPage();
      } else {
        return const HomePage();
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}

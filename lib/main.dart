import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/proyectemos_prof.dart';
import 'firebase_options.dart';

bool? isRegistrationCompleted;

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final preferences = await SharedPreferences.getInstance();
  isRegistrationCompleted = preferences.getBool('emailSaved');
  runApp(const ProyectemosProf());
}

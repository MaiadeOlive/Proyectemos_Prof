import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_services.dart';
import '../services/firebase/db_firestore_helper.dart';

class ProyectemosRepository extends ChangeNotifier {
  late FirebaseFirestore db;
  AuthService authService = AuthService();
  late SharedPreferences sharedPreferences;
  String? studentInfo = '';

  ProyectemosRepository() {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }
}

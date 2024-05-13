import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../services/auth_services.dart';

class RepositoryImpl extends ChangeNotifier {
  AuthService authService = AuthService();

  Future<void> saveSchoolName<T>(Map<String, dynamic> schoolName) async {
    final schoolsRef = FirebaseFirestore.instance.collection('escolas/');
    try {
      await schoolsRef.add(schoolName);
    } on Exception catch (e) {
      e.toString();
    }
    notifyListeners();
  }

  Future<String> getSchoolId(String schoolNameParams) async {
    final schoolsRef = FirebaseFirestore.instance.collection('escolas');
    String schoolId = '';

    try {
      await schoolsRef.get().then((QuerySnapshot querySnapshot) {
        for (final doc in querySnapshot.docs) {
          final schoolName = doc.data();
          if (schoolName == null) return;
          if ((schoolName as Map)['schoolName'] == schoolNameParams) {
            schoolId = doc.id.toString();
          }
        }
      });
    } catch (error) {
      error.toString();
    }
    return schoolId;
  }

  Future<void> saveClassRoomInfo<T>(
    String schoolName,
    Map<String, dynamic> classRoomInfo,
  ) async {
    final schoolId = await getSchoolId(schoolName);

    final classRoomRef = FirebaseFirestore.instance
        .collection('escolas/')
        .doc('$schoolId/')
        .collection('turmas/');

    try {
      await classRoomRef.add(classRoomInfo);
    } on Exception catch (e) {
      e.toString();
    }
    notifyListeners();
  }

  Future<String> getClassRoomId(String schoolId, String classNameParams) async {
    final classRoomRef = FirebaseFirestore.instance
        .collection('escolas/')
        .doc('$schoolId/')
        .collection('turmas');
    String classRoomId = '';

    try {
      await classRoomRef.get().then((QuerySnapshot querySnapshot) {
        for (final doc in querySnapshot.docs) {
          final className = doc.data();
          if (className == null) return;
          if ((className as Map)['classRoom'] == classNameParams) {
            classRoomId = doc.id.toString();
            break;
          }
        }
      });
    } catch (error) {
      error.toString();
    }
    return classRoomId;
  }

  Future<void> saveTeacherEmail<T>(
    String schoolName,
    String classRoomName,
    Map<String, dynamic> teacherEmail,
  ) async {
    final schoolId = await getSchoolId(schoolName);
    final classRoomId = await getClassRoomId(schoolId, classRoomName);

    if (schoolId.isEmpty || classRoomId.isEmpty) {
      return;
    }

    final teacherRef = FirebaseFirestore.instance
        .collection('escolas')
        .doc(schoolId)
        .collection('turmas')
        .doc(classRoomId)
        .collection('professore');
    try {
      await teacherRef.add(teacherEmail);
    } on Exception catch (e) {
      e.toString();
    }
    notifyListeners();
  }
}

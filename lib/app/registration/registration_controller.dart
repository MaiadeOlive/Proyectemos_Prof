import '../../repository/repository_impl.dart';

class RegistrationController {
  final _repository = RepositoryImpl();

  // Future<void> saveTeacherEmail(teacherEmail) async {
  //   await _repository.saveTeacherEmail(teacherEmail);
  // }

  // Future<void> saveClassInformations(
  //   school,
  //   classRoom,
  //     teacherEmail
  // ) async {
  //   await _repository.saveClassInformation(school, classRoom, teacherEmail);
  // }

  Future<void> saveSchoolName(schoolInfo) async {
    await _repository.saveSchoolName(schoolInfo);
  }

  Future<void> saveClassRoomName(schoolName, classRoomInfo,) async {
    await _repository.saveClassRoomInfo(schoolName, classRoomInfo);
  }

  Future<void> saveTeacherEmail(schoolName, classRoomInfo, teacherName, teacherEmail) async {
    await _repository.saveTeacherEmail(schoolName, classRoomInfo, teacherEmail);
  }

}

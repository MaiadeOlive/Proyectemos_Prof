
abstract class Repository<T, U, V> {
  Future<void> savedInformations(T taskName);
  Future<void> saveTeacherEmailFirebase(Map<String, T> schoolInformations, Map<String, T> email);
  Future<void> saveSchoolInformationFirebase(Map<String, T> schoolInformations);
}

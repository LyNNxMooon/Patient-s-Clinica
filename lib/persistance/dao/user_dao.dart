import 'package:clinica_patient/persistance/dao/pref_instance.dart';
import 'package:clinica_patient/persistance/preferences_key_constant.dart';

class PatientInfoDAO {
  PatientInfoDAO._();
  static final PatientInfoDAO _singleton = PatientInfoDAO._();
  factory PatientInfoDAO() => _singleton;

  //save data
  void saveToken(String token) {
    PrefInstance.getSharedPreferences.setString(kTokenKey, token);
  }

  void savePatientName(String name) {
    PrefInstance.getSharedPreferences.setString(kPatientNameKey, name);
  }

  void savePatientEmail(String email) {
    PrefInstance.getSharedPreferences.setString(kPatientEmailKey, email);
  }

  void savePatientID(String id) {
    PrefInstance.getSharedPreferences.setString(kPatientIDKey, id);
  }

  void savePickedDate(String date) {
    PrefInstance.getSharedPreferences.setString(kSearchByDateKey, date);
  }

  void saveAge(int age) {
    PrefInstance.getSharedPreferences.setInt(kPatientAgeKey, age);
  }

  void saveHistory(String history) {
    PrefInstance.getSharedPreferences
        .setString(kPatientAllergicHistoryKey, history);
  }

  void saveMedicine(String medicine) {
    PrefInstance.getSharedPreferences
        .setString(kPatientAllergicMedicineKey, medicine);
  }

  //check
  bool get isToken => PrefInstance.getSharedPreferences.containsKey(kTokenKey);

  //get data
  String? get getPatientId =>
      PrefInstance.getSharedPreferences.getString(kPatientIDKey);

  String? get getPatientName =>
      PrefInstance.getSharedPreferences.getString(kPatientNameKey);

  String? get getPickedDate =>
      PrefInstance.getSharedPreferences.getString(kSearchByDateKey);

  String? get getToken =>
      PrefInstance.getSharedPreferences.getString(kTokenKey);

  String? get getEmail =>
      PrefInstance.getSharedPreferences.getString(kPatientEmailKey);

  int? get getAge => PrefInstance.getSharedPreferences.getInt(kPatientAgeKey);

  String? get getHistory =>
      PrefInstance.getSharedPreferences.getString(kPatientAllergicHistoryKey);

  String? get getMedicine =>
      PrefInstance.getSharedPreferences.getString(kPatientAllergicMedicineKey);

  //remove data
  void removeToken() => PrefInstance.getSharedPreferences.remove(kTokenKey);
}

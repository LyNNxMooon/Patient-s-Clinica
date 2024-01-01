import 'package:clinica_patient/persistance/dao/user_dao.dart';

class PatientInfoModel {
  PatientInfoModel._();

  static final PatientInfoModel _singleton = PatientInfoModel._();

  factory PatientInfoModel() => _singleton;

  final PatientInfoDAO _patientInfoDAO = PatientInfoDAO();

  //save data
  void saveToken(String token) {
    _patientInfoDAO.saveToken(token);
  }

  void savePatientID(String id) {
    _patientInfoDAO.savePatientID(id);
  }

  void savePatientName(String name) {
    _patientInfoDAO.savePatientName(name);
  }

  void savePatientEmail(String email) {
    _patientInfoDAO.savePatientEmail(email);
  }

  void savePickedDate(String date) {
    _patientInfoDAO.savePickedDate(date);
  }

  void saveAge(int age) {
    _patientInfoDAO.saveAge(age);
  }

  void saveHistory(String history) {
    _patientInfoDAO.saveHistory(history);
  }

  void saveMedicine(String medicine) {
    _patientInfoDAO.saveMedicine(medicine);
  }

  //check
  bool get isToken => _patientInfoDAO.isToken;

  //get data
  String get getPatientId => _patientInfoDAO.getPatientId ?? '';
  String get getPatientName => _patientInfoDAO.getPatientName ?? '';
  String get getPickedDate => _patientInfoDAO.getPickedDate ?? '';
  String get getToken => _patientInfoDAO.getToken ?? '';
  String get getEmail => _patientInfoDAO.getEmail ?? '';
  int get getAge => _patientInfoDAO.getAge ?? 0;
  String get getHistory => _patientInfoDAO.getHistory ?? 'None';
  String get getMedicine => _patientInfoDAO.getMedicine ?? 'None';

  //remove data
  void removeToken() {
    _patientInfoDAO.removeToken();
  }
}

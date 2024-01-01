import 'package:clinica_patient/data/model/patient_info_model.dart';
import 'package:clinica_patient/data/vos/medical_record_vo.dart';
import 'package:clinica_patient/network/api/medical_records_api.dart';
import 'package:clinica_patient/network/data_agent/medical_records_data_agent.dart';
import 'package:dio/dio.dart';

class MedicalRecordsDataAgentImpl extends MedicalRecordsDataAgent {
  final PatientInfoModel _patientInfoModel = PatientInfoModel();
  late MedicalRecordsAPI _medicalRecordsAPI;
  MedicalRecordsDataAgentImpl._() {
    _medicalRecordsAPI = MedicalRecordsAPI(Dio());
  }

  static final MedicalRecordsDataAgentImpl _singleton =
      MedicalRecordsDataAgentImpl._();

  factory MedicalRecordsDataAgentImpl() => _singleton;
  @override
  Future<List<MedicalRecordVO>> getMedicalRecords() => _medicalRecordsAPI
      .getAllMedicalRecords('Bearer ${_patientInfoModel.getToken}',
          _patientInfoModel.getPatientId, _patientInfoModel.getPickedDate)
      .asStream()
      .map((event) => event)
      .first;
}

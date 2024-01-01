import 'package:clinica_patient/data/vos/medical_record_vo.dart';
import 'package:clinica_patient/network/data_agent/medical_records_data_agent.dart';
import 'package:clinica_patient/network/data_agent/medical_records_data_agent_impl.dart';

class MedicalRecordModel {
  MedicalRecordModel._();
  static final MedicalRecordModel _singleton = MedicalRecordModel._();
  factory MedicalRecordModel() => _singleton;
  final MedicalRecordsDataAgent _medicalRecordsDataAgent =
      MedicalRecordsDataAgentImpl();

  Future<List<MedicalRecordVO>> getAllRecords() =>
      _medicalRecordsDataAgent.getMedicalRecords();
}

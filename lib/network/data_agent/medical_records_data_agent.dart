import 'package:clinica_patient/data/vos/medical_record_vo.dart';

abstract class MedicalRecordsDataAgent {
  Future<List<MedicalRecordVO>> getMedicalRecords();
}

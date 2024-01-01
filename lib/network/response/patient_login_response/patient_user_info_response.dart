import 'package:json_annotation/json_annotation.dart';
part 'patient_user_info_response.g.dart';

@JsonSerializable()
class PatientUserInfoResponse {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'patient_nrc')
  final String? patientNrc;

  @JsonKey(name: 'patient_name')
  final String? patientName;

  @JsonKey(name: 'patient_email')
  final String? patientEmail;

  @JsonKey(name: 'patient_phone')
  final String? patientPhone;

  @JsonKey(name: 'patient_dob')
  final String? patientDob;

  @JsonKey(name: 'patient_age')
  final int? patientAge;

  @JsonKey(name: 'patient_sex')
  final String? patientSex;

  @JsonKey(name: 'patient_height')
  final String? patientHeight;

  @JsonKey(name: 'patient_weight')
  final String? patientWeight;

  @JsonKey(name: 'patient_address')
  final String? patientAddress;

  @JsonKey(name: 'allergic_history')
  final List? allergicHistory;

  @JsonKey(name: 'medical_history')
  final List? medicalHistory;

  @JsonKey(name: 'visited_doctor_list')
  final List? visitedDoctorList;

  @JsonKey(name: 'visited_hospital_clinic_list')
  final List? visitedHospitalClinicList;

  @JsonKey(name: 'patient_password')
  final String? patientPassword;

  final String? role;

  @JsonKey(name: 'patient_medical_records')
  final List? patientMedicalRecord;

  PatientUserInfoResponse(
      {required this.id,
      required this.patientNrc,
      required this.patientName,
      required this.patientEmail,
      required this.patientPhone,
      required this.patientDob,
      required this.patientAge,
      required this.patientSex,
      required this.patientHeight,
      required this.patientWeight,
      required this.patientAddress,
      required this.allergicHistory,
      required this.medicalHistory,
      required this.visitedDoctorList,
      required this.visitedHospitalClinicList,
      required this.patientPassword,
      required this.role,
      required this.patientMedicalRecord});

  factory PatientUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientUserInfoResponseFromJson(json);
}

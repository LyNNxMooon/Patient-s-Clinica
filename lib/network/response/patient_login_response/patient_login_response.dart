import 'package:clinica_patient/network/response/patient_login_response/patient_user_info_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'patient_login_response.g.dart';

@JsonSerializable()
class PatientLoginResponse {
  final String? token;
  final PatientUserInfoResponse? user;
  final String? msg;

  PatientLoginResponse(
      {required this.token, required this.user, required this.msg});

  factory PatientLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientLoginResponseFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';
part 'send_patient_credential.g.dart';

@JsonSerializable()
class SendPatientCredential {
  @JsonKey(name: "patient_email")
  final String patientEmail;
  final String password;

  SendPatientCredential({required this.patientEmail, required this.password});

  Map<String, dynamic> toJson() => _$SendPatientCredentialToJson(this);
}

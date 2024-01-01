// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_patient_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendPatientCredential _$SendPatientCredentialFromJson(
        Map<String, dynamic> json) =>
    SendPatientCredential(
      patientEmail: json['patient_email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SendPatientCredentialToJson(
        SendPatientCredential instance) =>
    <String, dynamic>{
      'patient_email': instance.patientEmail,
      'password': instance.password,
    };

import 'package:clinica_patient/data/vos/medical_record_vo.dart';
import 'package:clinica_patient/network/api_constant/api_constant.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'medical_records_api.g.dart';

@RestApi(baseUrl: kBaseURLForClinica)
abstract class MedicalRecordsAPI {
  factory MedicalRecordsAPI(Dio dio) => _MedicalRecordsAPI(dio);
  @GET(kEndPointForPatientMedicalRecordSearchByDate)
  @FormUrlEncoded()
  Future<List<MedicalRecordVO>> getAllMedicalRecords(
      @Header(kAuthKey) String authorization,
      @Field(kBodyKeyForMedicalRecords) String patientId,
      @Field(kBodyKeyForPickedDate) String date);
}

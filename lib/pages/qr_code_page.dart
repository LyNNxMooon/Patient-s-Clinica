import 'package:clinica_patient/constants/colors.dart';
import 'package:clinica_patient/constants/strings.dart';
import 'package:clinica_patient/data/model/patient_info_model.dart';
import 'package:clinica_patient/pages/home_page.dart';
import 'package:clinica_patient/widgets/image_background_view.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeFirstPage extends StatelessWidget {
  QRCodeFirstPage({super.key});

  final PatientInfoModel _patientInfoModel = PatientInfoModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const BackgroundView(),
          Align(
            alignment: Alignment.center,
            child: buildContent(context),
          ),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            kLogoNameText,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: kSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            _patientInfoModel.getPatientName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            kScanNowForTreatmentText,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
            child: QrImageView(
              data: _patientInfoModel.getPatientId,
              version: QrVersions.auto,
              size: 300.0,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 30),
          child: Text(
            'Or',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
        ),
        buildElevatedButton(context),
      ],
    );
  }

  Widget buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: kBlackColor,
        backgroundColor: kSecondaryColor,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: const SizedBox(
        width: 300,
        height: 30,
        child: Center(
          child: Text(
            kGoToMedicalRecordText,
            style: TextStyle(fontSize: 20, color: kBlackColor),
          ),
        ),
      ),
    );
  }
}

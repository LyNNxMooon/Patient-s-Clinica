import 'package:clinica_patient/constants/colors.dart';
import 'package:clinica_patient/data/model/patient_info_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PatientQRCode extends StatelessWidget {
  PatientQRCode({super.key});

  final PatientInfoModel _patientInfoModel = PatientInfoModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan QR for Treatment',
          style: TextStyle(color: kBlackColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kBlackColor,
            ),
          )
        ],
      ),
      body: Center(
        child: QrImageView(
          data: _patientInfoModel.getPatientId,
          version: QrVersions.auto,
          size: 300.0,
        ),
      ),
    ));
  }
}

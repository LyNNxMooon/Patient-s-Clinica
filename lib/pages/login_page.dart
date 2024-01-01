import 'dart:convert';

import 'package:clinica_patient/constants/colors.dart';
import 'package:clinica_patient/constants/dimensions.dart';
import 'package:clinica_patient/constants/strings.dart';
import 'package:clinica_patient/data/model/patient_info_model.dart';
import 'package:clinica_patient/network/response/patient_login_response/patient_login_response.dart';
import 'package:clinica_patient/network/send/send_patient_credential.dart';
import 'package:clinica_patient/pages/qr_code_page.dart';
import 'package:clinica_patient/widgets/image_background_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientLoginPage extends StatelessWidget {
  const PatientLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Stack(
              children: [BackgroundView(), Center(child: LoginSessionView())])),
    );
  }
}

class LoginSessionView extends StatefulWidget {
  const LoginSessionView({super.key});

  @override
  State<LoginSessionView> createState() => _LoginSessionViewState();
}

class _LoginSessionViewState extends State<LoginSessionView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? errorText = '';
  final PatientInfoModel _patientInfoModel = PatientInfoModel();

  void send() async {
    SendPatientCredential sendPatientCredential = SendPatientCredential(
        patientEmail: _email.text, password: _password.text);

    var uri = Uri.https("clinica-app.onrender.com", "patients-login");
    var response = await http.post(uri,
        body: json.encode(sendPatientCredential.toJson()),
        headers: {"Content-type": "application/json"});

    var httpResponse = json.decode(response.body);
    PatientLoginResponse loginResponse =
        PatientLoginResponse.fromJson(httpResponse);

    if (loginResponse.token != null) {
      _patientInfoModel.saveToken(loginResponse.token!);
      _patientInfoModel.savePatientID(loginResponse.user!.id!);
      _patientInfoModel.savePatientName(loginResponse.user!.patientName!);
      _patientInfoModel.savePatientEmail(loginResponse.user!.patientEmail!);
      _patientInfoModel.saveAge(loginResponse.user!.patientAge!);
      _patientInfoModel.saveHistory(loginResponse.user!.allergicHistory![0]);
      _patientInfoModel.saveMedicine(loginResponse.user!.medicalHistory![0]);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QRCodeFirstPage(),
          ));
    } else if (loginResponse.msg != null) {
      setState(() {
        errorText = loginResponse.msg;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP25x),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '$kLogoNameText $kLoginTitleText',
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: kFontSize40x,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: kSP40x,
            ),
            TextFormField(
              style: const TextStyle(color: kPrimaryColor),
              controller: _email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: kEmailTextFormText,
                  fillColor: kPrimaryColor),
            ),
            const SizedBox(
              height: kSP20x,
            ),
            TextFormField(
              obscureText: true,
              controller: _password,
              style: const TextStyle(color: kPrimaryColor),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: kPasswordTextFormText,
                fillColor: kPrimaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kSP10x),
              child: Text(
                errorText!,
                style: const TextStyle(
                    color: kErrorColor, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                send();
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kSecondaryColor)),
              child: const Text(
                kLoginTitleText,
                style: TextStyle(color: kBlackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

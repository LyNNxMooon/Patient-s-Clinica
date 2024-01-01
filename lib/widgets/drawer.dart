import 'package:clinica_patient/constants/colors.dart';
import 'package:clinica_patient/constants/dimensions.dart';
import 'package:clinica_patient/constants/strings.dart';
import 'package:clinica_patient/data/model/patient_info_model.dart';
import 'package:clinica_patient/pages/login_page.dart';

import 'package:clinica_patient/pages/patient_profile_page.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  DrawerView({super.key});

  final PatientInfoModel _patientInfoModel = PatientInfoModel();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      const DrawerHeader(
        decoration: BoxDecoration(color: kSecondaryColor),
        child: Text(
          kLogoNameText,
          style: TextStyle(fontSize: kFontSize30x, fontWeight: FontWeight.bold),
        ),
      ),
      ListTile(
          title: const Text(
            kProfileText,
            style:
                TextStyle(fontSize: kFontSize18x, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PatientProfilePage(),
                ));
          }),
      ListTile(
          title: const Text(
            'Logout',
            style:
                TextStyle(fontSize: kFontSize18x, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            _patientInfoModel.removeToken();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PatientLoginPage(),
                ));
          })
    ]));
  }
}

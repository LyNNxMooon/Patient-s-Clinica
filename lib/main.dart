import 'package:clinica_patient/constants/colors.dart';
import 'package:clinica_patient/constants/dimensions.dart';
import 'package:clinica_patient/constants/strings.dart';
import 'package:clinica_patient/data/model/patient_info_model.dart';
import 'package:clinica_patient/data/model/provider_model.dart';
import 'package:clinica_patient/pages/login_page.dart';
import 'package:clinica_patient/pages/qr_code_page.dart';
import 'package:clinica_patient/persistance/dao/pref_instance.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await PrefInstance.createSharedPreferencesInstance();
  final PatientInfoModel patientInfoModel = PatientInfoModel();
  patientInfoModel.savePickedDate(
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}');

  runApp(ChangeNotifierProvider(
    create: (context) => DataModel(),
    child: MyApp(
      isToken: patientInfoModel.isToken,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isToken});

  final bool isToken;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 2500,
            splash: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  kLogoNameText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: kFontSize45x,
                      color: kPrimaryColor,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  width: kSP5x,
                ),
                Text(
                  kSplashScreenText,
                  style: TextStyle(fontSize: kFontSize40x, color: kBlackColor),
                )
              ],
            ),
            // ignore: unrelated_type_equality_checks
            nextScreen: isToken ? QRCodeFirstPage() : const PatientLoginPage(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: kSecondaryColor));
  }
}

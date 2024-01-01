import 'package:clinica_patient/constants/colors.dart';
import 'package:clinica_patient/constants/dimensions.dart';
import 'package:clinica_patient/constants/strings.dart';
import 'package:clinica_patient/data/model/medical_record_model.dart';
import 'package:clinica_patient/data/model/patient_info_model.dart';
import 'package:clinica_patient/data/model/provider_model.dart';
import 'package:clinica_patient/data/vos/medical_record_vo.dart';
import 'package:clinica_patient/pages/medical_record_detail_page.dart';
import 'package:clinica_patient/pages/patient_qr_code_page.dart';

import 'package:clinica_patient/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final MedicalRecordModel medicalRecordModel = MedicalRecordModel();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PatientInfoModel _patientInfoModel = PatientInfoModel();
  Future refresh() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
      builder: (context, value1, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: kBlackColor,
          ),
          drawer: DrawerView(),
          body: RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                  child: Container(
                margin: const EdgeInsets.only(left: 40, right: 40, bottom: 50),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1,
                child: Align(
                    //alignment: Alignment.topCenter,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            kLogoNameText,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: kSecondaryColor),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PatientQRCode(),
                                  ));
                            },
                            icon: const Icon(
                              Icons.qr_code_outlined,
                              size: 50,
                              color: kSecondaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: kSP30x, left: kSP5x, right: kSP5x),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2026))
                                    .then((value) {
                                  _patientInfoModel.savePickedDate(
                                      '${value!.year}-${value.month}-${value.day}');

                                  final selectDate = context.read<DataModel>();
                                  selectDate.selectedDate(value);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ));
                                });
                              },
                              icon: const Icon(Icons.date_range)),
                          Text(
                            DateFormat.yMMMd().format(value1.date),
                            style: const TextStyle(
                                fontSize: kFontSize20x,
                                fontWeight: FontWeight.bold,
                                color: kBlackColor),
                          )
                        ],
                      ),
                    ),
                    const MedicalRecordLogSessionView()
                  ],
                )),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class MedicalRecordLogSessionView extends StatefulWidget {
  const MedicalRecordLogSessionView({super.key});

  @override
  State<MedicalRecordLogSessionView> createState() =>
      _MedicalRecordLogSessionViewState();
}

class _MedicalRecordLogSessionViewState
    extends State<MedicalRecordLogSessionView> {
  Future _refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: medicalRecordModel.getAllRecords(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        var result = snapshot.data;
        return Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          child: result!.isEmpty
              ? const Center(child: Text("No Records"))
              : RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedicalRecordDetailPage(
                                      bloodPressure: result[index]
                                          .bloodPressure
                                          .toString(),
                                      cause: result[index].causeOfIllness,
                                      hospitalName: result[index].hospitalName,
                                      doctorName: result[index].doctorName,
                                      time: result[index].recordCreatedDate,
                                      illness: result[index].illnessName,
                                      medication:
                                          "${result[index].medication[0]} , ${result[index].medication[1]}",
                                      recommendation:
                                          result[index].doctorRecommendation,
                                      temp: result[index].bodyTemp.toString(),
                                      heartRate:
                                          result[index].heartRate.toString()),
                                ));
                          },
                          child: MedicalRecordLogItemView(
                              medicalRecordVO: result[index])),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                      itemCount: result.length),
                ),
        );
      },
    );
  }
}

class MedicalRecordLogItemView extends StatelessWidget {
  const MedicalRecordLogItemView({
    super.key,
    this.medicalRecordVO,
  });

  final MedicalRecordVO? medicalRecordVO;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(237, 237, 237, 1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSP20x, vertical: kSP20x),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 100,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              medicalRecordVO!.illnessName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: kSP10x,
                            ),
                            Text(
                              medicalRecordVO!.doctorName,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              medicalRecordVO!.hospitalName,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}

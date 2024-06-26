import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/view/home/appointment/patient/AppointmentTab.dart';

import 'CaseDetailsCard.dart';
import 'DoctorDetailsCard.dart';

class PatientCaseDetailsScreen extends StatefulWidget {
  late final Object argument;

  PatientCaseDetailsScreen({required this.argument});

  @override
  State<PatientCaseDetailsScreen> createState() =>
      _PatientCaseDetailsScreenState();
}

class _PatientCaseDetailsScreenState extends State<PatientCaseDetailsScreen> {
  late String patientName;
  late String caseDescription;
  late String diagnosis;
  late String treatment;
  bool showReports =false;
  late String title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var argumentsMap = widget.argument as Map;

    patientName = argumentsMap["patientName"];
    caseDescription = argumentsMap["caseDescription"];
    diagnosis = argumentsMap["diagnosis"];
    treatment = argumentsMap["treatment"];
    showReports=argumentsMap["showReports"];

    title=showReports?"Case Details":"Appointment Detail";
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm')
        .format(DateTime.now().add(Duration(days: 1)));
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey[400]!,
                      width: 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: DoctorDetailsCard(
                    argument: {
                      "doctorName": 'Dr. Smith',
                      "specialization": 'Cardiologist',
                      "contactNumber": '123-456-7890',
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.grey[400]!,
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CaseDetailsCard(argument: {
                          "patientName": 'John Doe',
                          "caseDescription": 'Follow-up for hypertension',
                          "diagnosis": 'Hypertension Stage 1',
                          "treatment": 'Medication adjustment',
                          "appointmentTime": formattedDate
                        }),
                        Padding(
                          padding: EdgeInsets.only(right: 20, bottom: 20),
                          child: showReports?
                            caseHistoryReports(context, (result) {
                              if (result == "report") {
                                launchURL(
                                    "https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");
                              } else if (result == "bill") {
                                launchURL(
                                    "https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");
                              } else if (result == "prescription") {
                                launchURL(
                                    "https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");
                              }
                            }):showCancelAndReschedule(context),

                        )
                      ],
                    )),
              ],
            ),
          ),
        ]));
  }
}

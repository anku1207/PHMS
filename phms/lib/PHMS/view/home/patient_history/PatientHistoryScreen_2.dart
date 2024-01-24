import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/CaseRegRequestVO.dart'
    as CaseRegRequest;
import 'package:phms/PHMS/model/request_model/CaseSummaryDoctorRequestVO.dart';
import 'package:phms/PHMS/model/response_model/CaseRegResponseVO.dart'
    as CaseRegResponse;
import 'package:phms/PHMS/model/response_model/CaseSummaryDoctorResponseVO.dart'
    as CaseSummaryDoctorResponse;
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart' as Login;
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;
import 'package:phms/PHMS/components/constants.dart' as Constants;

class PatientHistoryScreen_2 extends StatefulWidget {
  late final Data argument;

  PatientHistoryScreen_2({required this.argument});

  @override
  State<PatientHistoryScreen_2> createState() => _PatientHistoryScreen_2State();
}

class _PatientHistoryScreen_2State extends State<PatientHistoryScreen_2> {
  List<CaseSummaryDoctorResponse.Data> caseSummaryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      getPatientCaseDetail(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        if (EasyLoading.isShow)
          return false;
        else
          return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Patient History",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Container(
            color: Constants.UavPrimaryColor,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Card(
                        // margin: EdgeInsets.zero,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
                        child: SingleChildScrollView(
                            child: Column(
                          children: <Widget>[
                            SizedBox(height: 40),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 100.0,
                                    width: 100.0,
                                    child: Image.asset(
                                        "assets/images/viewhistory.png"),
                                  ),
                                  Text(
                                    "View Case",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        "Patient Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${widget.argument.patientname}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: caseSummaryList.isNotEmpty
                                            ? Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                          ),
                                          child: DataTable(
                                            columns: [
                                              DataColumn(
                                                label: Container(
                                                  width: 60,
                                                  child: Center(
                                                    child: Text('No', style: TextStyle(color: Colors.black)),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Container(
                                                  width: 100,
                                                  child: Center(
                                                    child: Text('Date', style: TextStyle(color: Colors.black)),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Container(
                                                  width: 150,
                                                  child: Center(
                                                    child: Text('Patient Name', style: TextStyle(color: Colors.black)),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Container(
                                                  width: 120,
                                                  child: Center(
                                                    child: Text('Mobile Number', style: TextStyle(color: Colors.black)),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Container(
                                                  width: 100,
                                                  child: Center(
                                                    child: Text('Attachments', style: TextStyle(color: Colors.black)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            rows: caseSummaryList.map((CaseSummaryDoctorResponse.Data rowData) {
                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                    Container(
                                                      width: 60,
                                                      child: Center(
                                                        child: Text('${rowData.caseID}'),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Container(
                                                      width: 100,
                                                      child: Center(
                                                        child: Text('${rowData.casedatetime}'),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Container(
                                                      width: 150,
                                                      child: Center(
                                                        child: Text('${rowData.patientname}'),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Container(
                                                      width: 120,
                                                      child: Center(
                                                        child: Text('${rowData.mobile}'),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Container(
                                                      width: 100,
                                                      child: Center(
                                                        child: Icon(Icons.attachment),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                        )
                                            : Center(
                                          child: Text(
                                            'Data Not Found',
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        )) //
                        ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void getPatientCaseDetail(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    checkCustomerSession().then((value) {
      if (value != null) {
        print('Value before decoding: $value');
        Map<String, dynamic> data1 = jsonDecode(value);
        Login.Data data = Login.Data.fromJson(data1);

        Case cases =
            Case(doctorID: data.userid, patientID: widget.argument.patientID);
        CaseSummaryDoctorRequestVO caseSummaryDoctorRequestVO =
            CaseSummaryDoctorRequestVO(cases: cases);

        print("caseSummaryDoctorRequestVO ___" +
            caseSummaryDoctorRequestVO.toJson().toString());
        Future<CaseSummaryDoctorResponse.CaseSummaryDoctorResponseVO?>
            patientCaseResponseData =
            API.patientCaseSummary(caseSummaryDoctorRequestVO);
        patientCaseResponseData.catchError(
          (onError) {
            print(onError.toString());
            showToastShortTime(context, onError.toString());
          },
        ).then((value) {
          if (value != null) {
            if (value.success == "1") {
              setState(() {
                caseSummaryList.addAll(value.data!);
              });
            } else {
              showAlertDialog(
                  context: context,
                  btnNameOk: "ok",
                  btnNameCancel: null,
                  title: "Oops! ",
                  message: value.message!);
            }
          }
        }).whenComplete(() {
          print("called when future completes");
          EasyLoading.dismiss();
        });
      }
    });
  }
}

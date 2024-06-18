import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/FullSizeImageDialog.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/CaseSummaryDoctorRequestVO.dart';
import 'package:phms/PHMS/model/response_model/CaseSummaryDoctorResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CaseSummaryResponseVO.dart' as CaseSummaryResponseVO;
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart' as Login;
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;
import 'package:phms/PHMS/components/constants.dart' as Constants;


class HistoryScreen_1 extends StatefulWidget {
  late final Object argument;

  HistoryScreen_1({required this.argument});

  @override
  State<HistoryScreen_1> createState() => _HistoryScreen_1State();
}

class _HistoryScreen_1State extends State<HistoryScreen_1> {
  List<CaseSummaryResponseVO.Data> caseSummaryList = [];
  double twoLineHeight = 0;

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
    double totalWidth = MediaQuery.of(context).size.width;
    double leftPadding = 0.0;
    double rightPadding = 0.0;

    double availableWidth = totalWidth - leftPadding - rightPadding;

    TextStyle patientNameStyle = Theme.of(context)
        .textTheme
        .button!
        .copyWith(fontWeight: FontWeight.bold);


    double patientNameTextHeight =
        (getTextHeight("A", patientNameStyle) + 20)*2;
    print("height  $patientNameTextHeight" );

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
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                    child: Card(
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
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
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: caseSummaryList.isNotEmpty
                                                ? IntrinsicWidth(
                                              child: Container(
                                                child: Table(
                                                  columnWidths: {
                                                    0: FixedColumnWidth(
                                                        availableWidth * 0.12),
                                                    1: FixedColumnWidth(
                                                        availableWidth * 0.2),
                                                    2: FixedColumnWidth(
                                                        availableWidth * 0.28),
                                                    3: FixedColumnWidth(
                                                        availableWidth * 0.2),
                                                    4: FixedColumnWidth(
                                                        availableWidth * 0.18),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        TableCell(
                                                            child: Container(
                                                              height:
                                                              patientNameTextHeight,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Constants
                                                                    .UavPrimaryColor,
                                                                border: Border(
                                                                  right:
                                                                  BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    // Set the color of the right border
                                                                    width:
                                                                    5.0, // Set the width of the right border
                                                                  ),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    5.0,
                                                                    top:
                                                                    5.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    'No',
                                                                    textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                    style: Theme.of(
                                                                        context)
                                                                        .textTheme
                                                                        .button!
                                                                        .copyWith(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )),
                                                        TableCell(
                                                          child: Container(
                                                            height: patientNameTextHeight,
                                                            decoration: BoxDecoration(
                                                              color: Constants.UavPrimaryColor,
                                                              border: Border(
                                                                right: BorderSide(
                                                                  color: Colors.white, // Set the color of the right border
                                                                  width: 5.0, // Set the width of the right border
                                                                ),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                              child: Center(
                                                                child: Text(
                                                                  'Date',
                                                                  textAlign: TextAlign.center,
                                                                  style: Theme.of(context).textTheme.button!.copyWith(
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        TableCell(
                                                          child: Container(
                                                            height: patientNameTextHeight,
                                                            decoration: BoxDecoration(
                                                              color: Constants.UavPrimaryColor,
                                                              border: Border(
                                                                right: BorderSide(
                                                                  color: Colors.white, // Set the color of the right border
                                                                  width: 5.0, // Set the width of the right border
                                                                ),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                              child: Center(
                                                                child: Text(
                                                                  'Doctor\nName',
                                                                  textAlign: TextAlign.center,
                                                                  style: Theme.of(context).textTheme.button!.copyWith(
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        TableCell(
                                                          child: Container(
                                                            height: patientNameTextHeight,
                                                            decoration: BoxDecoration(
                                                              color: Constants.UavPrimaryColor,
                                                              border: Border(
                                                                right: BorderSide(
                                                                  color: Colors.white, // Set the color of the right border
                                                                  width: 5.0, // Set the width of the right border
                                                                ),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                              child: Center(
                                                                child: Text(
                                                                  'Mobile\nNumber',
                                                                  textAlign: TextAlign.center,
                                                                  style: Theme.of(context).textTheme.button!.copyWith(
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        TableCell(
                                                          child: Container(
                                                            height:
                                                            patientNameTextHeight,
                                                            color: Constants
                                                                .UavPrimaryColor,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  bottom:
                                                                  5.0,
                                                                  top:
                                                                  5.0),
                                                              child: Center(
                                                                child: Text(
                                                                  'Attach',
                                                                  textAlign:
                                                                  TextAlign
                                                                      .center,
                                                                  style: Theme.of(
                                                                      context)
                                                                      .textTheme
                                                                      .button!
                                                                      .copyWith(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    for (var rowData
                                                    in caseSummaryList)
                                                      TableRow(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0), // Set margin here
                                                            color: Color.fromRGBO(245, 245, 245, 1), // Set background color here
                                                            height:
                                                            patientNameTextHeight,
                                                            child: TableRowInkWell(
                                                              onTap: () {
                                                                tableRowClick(context, rowData.caseID!);
                                                              },
                                                              child: Padding(
                                                                padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    '${rowData.caseID}',
                                                                    maxLines: 2, // Set maximum lines here
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0), // Set margin here
                                                            color: Color.fromRGBO(245, 245, 245, 1),  // Set background color here
                                                            height:
                                                            patientNameTextHeight,
                                                            child: TableRowInkWell(
                                                              onTap: () {
                                                                tableRowClick(context, rowData.caseID!);
                                                              },
                                                              child: Padding(
                                                                padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    '${rowData.casedatetime}',
                                                                    maxLines: 2, // Set maximum lines here
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0), // Set margin here
                                                            color: Color.fromRGBO(245, 245, 245, 1), // Set background color here
                                                            height:
                                                            patientNameTextHeight,
                                                            child: TableRowInkWell(
                                                              onTap: () {
                                                                tableRowClick(context, rowData.caseID!);
                                                              },
                                                              child: Padding(
                                                                padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    '${rowData.doctorname}',
                                                                    maxLines: 2, // Set maximum lines here
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0), // Set margin here
                                                            color: Color.fromRGBO(245, 245, 245, 1), // Set background color here
                                                            height:
                                                            patientNameTextHeight,
                                                            child: TableRowInkWell(
                                                              onTap: () {
                                                                tableRowClick(context, rowData.caseID!);
                                                              },
                                                              child: Padding(
                                                                padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    '${rowData.mobile}',
                                                                    maxLines: 2, // Set maximum lines here
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0), // Set margin here
                                                            color: Color.fromRGBO(245, 245, 245, 1), // Set background color here
                                                            height:
                                                            patientNameTextHeight,
                                                            child: TableRowInkWell(
                                                              onTap: () {
                                                                if (rowData.soapPic != null) {
                                                                  showDialog(
                                                                    context: context,
                                                                    builder: (BuildContext context) {
                                                                      return FullSizeImageDialog(imageUrl: rowData.soapPic!);
                                                                    },
                                                                  );
                                                                }
                                                              },
                                                              child: Padding(
                                                                padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                                child: Center(
                                                                  child: Icon(Icons.attachment),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            )
                                                : Center(
                                              child: Text(
                                                'Data Not Found',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.bold,
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

  double getTextHeight(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    return textPainter.height;

  }

  void tableRowClick(BuildContext context, String caseId) {
    Navigator.pushNamed(context, UavRoutes.Patient_history_screen_3,
        arguments: caseId);
  }

  void getPatientCaseDetail(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    checkCustomerSession().then((value) {
      if (value != null) {
        print('Value before decoding: $value');
        Map<String, dynamic> data1 = jsonDecode(value);
        Login.Data data = Login.Data.fromJson(data1);

        Case cases =
        Case(patientID: data.userid);
        CaseSummaryDoctorRequestVO caseSummaryDoctorRequestVO =
        CaseSummaryDoctorRequestVO(cases: cases);

        print("caseSummaryDoctorRequestVO ___" +
            caseSummaryDoctorRequestVO.toJson().toString());
        Future<CaseSummaryResponseVO.CaseSummaryResponseVO?>
        patientCaseResponseData =
        API.caseSummary(caseSummaryDoctorRequestVO);
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
                  btnNameOk: "Ok",
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

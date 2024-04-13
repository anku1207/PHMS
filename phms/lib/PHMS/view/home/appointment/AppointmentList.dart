import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/AppointmentListRequestVO.dart';
import 'package:phms/PHMS/model/response_model/AppointmentListResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CaseSummaryResponseVO.dart' as CaseSummaryResponseVO;
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart' as Login;
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;
import 'package:phms/PHMS/components/constants.dart' as Constants;


class AppointmentList extends StatefulWidget {
  late final Object argument;
  AppointmentList({required this.argument});
  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {

  var argumentsMap;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    argumentsMap = widget.argument as Map;
    Future.delayed(Duration.zero, () {
      getAppointmentList(context);
    });
  }

  getAppointmentList(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());

    checkCustomerSession().then((value) {
      if (value != null) {
        print('Value before decoding: $value');
        Map<String, dynamic> data1 = jsonDecode(value);
        Login.Data data = Login.Data.fromJson(data1);

        Case cases =Case(doctorID: data.userid,fromDate: "",toDate: "",placeID: "",patientMobile: "",followup: "");

        AppointmentListRequestVO appointmentListRequestVO = new AppointmentListRequestVO(cases: cases);

        print("appointmentListRequestVO ___" +
            appointmentListRequestVO.toJson().toString());
        Future<AppointmentListResponseVO?>
        patientCaseResponseData =
        API.getAppointmentList(appointmentListRequestVO);
        patientCaseResponseData.catchError(
              (onError) {
            print(onError.toString());
            showToastShortTime(context, onError.toString());
          },
        ).then((value) {
          if (value != null) {
            if (value.success == "1") {
              setState(() {
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
              "Appointment List",
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
                        //elevation: 10,
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
                                        "View Appointment",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),

                            Card(
                                elevation: 10,
                                margin: EdgeInsets.all(10),
                                color: Colors.black12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(
                                    color: Constants.UavPrimaryColor, // Adjust border color here
                                    width: 1.0, // Adjust border width here
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "left",
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "right",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                            )

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
}

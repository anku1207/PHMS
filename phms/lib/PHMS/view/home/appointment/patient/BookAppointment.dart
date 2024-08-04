import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart' as Constants;
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/patient/CreateAppointmentReqVO.dart';
import 'package:phms/PHMS/model/response_model/patient/CreateAppointmentResVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart' as Login;

class BookAppointment extends StatefulWidget {
  late final Object argument;
  BookAppointment({required this.argument});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  bool mobileNumberValidate = false;
  var argumentsMap;
  late String bookingType;


  // Create controllers for each TextFormField
  late TextEditingController symptomsController;


  String? _selectedDate;
  String? _selectedTime;

  final List<String> _timeSlots = [
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
  ];

  List<String> _getNext7Days() {
    List<String> dates = [];
    for (int i = 0; i < 7; i++) {
      final date = DateTime.now().add(Duration(days: i));
      dates.add(DateFormat('yyyy-MM-dd').format(date));
    }
    return dates;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    argumentsMap = widget.argument as Map;
    setState(() {
      if(argumentsMap["booking_type"]?.toLowerCase()=="v"){
        bookingType="Video Appointment";
      }else if(argumentsMap["booking_type"]?.toLowerCase()=="re"){
        bookingType="Reschedule Appointment";
      }else{
        bookingType="Visit Clinic Appointment";
      }
    });
    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;
    mobileNumberValidate = false;
    symptomsController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    symptomsController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final List<String> _next7Days = _getNext7Days();

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
              "Book Appointment",
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
                                    "$bookingType",
                                    style: Theme
                                        .of(context)
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 20.0, right: 20.0),
                              child: Form(
                                key: _formKey,
                                autovalidateMode: _autoValidate,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      maxLines: 1,
                                      controller: symptomsController,
                                      keyboardType: TextInputType.text,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyText2,
                                      decoration: InputDecoration(
                                        counter: Offstage(),
                                        hintText: 'Patient Symptoms',
                                        labelText: 'Patient Symptoms',
                                        prefixIcon: const Icon(
                                          Icons.drive_file_rename_outline,
                                          color: Colors.grey,
                                        ),
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 20.0, horizontal: 20.0),
                                      ),
                                      validator: (value) =>
                                          validateRequiredField(value!),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        labelText: 'Date',
                                        labelStyle: TextStyle(fontSize: 10),
                                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                                        hintText: 'Select a date',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      items: _next7Days.map((String date) {
                                        return DropdownMenuItem<String>(
                                          value: date,
                                          child: Text(date,style: Theme.of(context).textTheme.bodyText2),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedDate = newValue;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        labelText: 'Time',
                                        labelStyle: TextStyle(fontSize: 10),
                                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                                        hintText: 'Select a time',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      items: _timeSlots.map((String time) {
                                        return DropdownMenuItem<String>(
                                          value: time,
                                          child: Text(time,style: Theme.of(context).textTheme.bodyText2),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedTime = newValue;
                                        });
                                      },
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            minWidth: double.infinity),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if ((_formKey.currentState?.validate() ?? false) && !isNullOrEmpty(_selectedDate) && !isNullOrEmpty(_selectedTime)) {



                                              appointmentConfirmation(context,"Appointment Confirmation","Your appointment with test Doctor is confirmed for $_selectedDate at $_selectedTime.", (result) {
                                                Navigator.pop(context);
                                                if (result?.toLowerCase() == "yes") {
                                                  createAppointment(context);
                                                }
                                              },yes:"Confirm",no:"No");

                                            }else{
                                              showToastShortTime(context,"Empty Field not allowed!");
                                            }
                                          },
                                          child: Text("Submit",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              )),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void createAppointment(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    checkCustomerSession().then((value) {
      if (value != null) {
        print('Value before decoding: $value');
        Map<String, dynamic> data1 = jsonDecode(value);
        Login.Data data = Login.Data.fromJson(data1);


       Case cases = new Case(doctorID: argumentsMap["doctor_id"],patientID: data.userid,placeID: "5",appointmentdatetime: _selectedDate!+" "+convertTo24HourFormat(_selectedTime!),reason:symptomsController.text );

       CreateAppointmentReqVO createRes = new CreateAppointmentReqVO(cases: cases);

        print("CreateAppointmentReqVO ___" + createRes.toJson().toString());
        Future<CreateAppointmentResVO?> responseData =
        API.bookAppointment(createRes);
        responseData.catchError(
              (onError) {
            print(onError.toString());
            showToastShortTime(context, onError.toString());
          },
        ).then((value) {
          if (value != null) {
            if (value.success == "1") {
              setState(() {
                showResponseDialogCbsl(
                    context,
                    AlertDialogDesignResponseWise(
                        "Success", value.message!, "OK", true), (clickBtn) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    UavRoutes.Home_Screen,
                        (route) => false,
                  );
                },backBtn: false);
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/model/request_model/CheckPatientRegistrationReqeust.dart';
import 'package:phms/PHMS/model/response_model/CheckPatientRegistrationResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;

class PatientRegistrationScreen extends StatefulWidget {

  @override
  State<PatientRegistrationScreen> createState() => _PatientRegistrationScreenState();
}

class _PatientRegistrationScreenState extends State<PatientRegistrationScreen> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  bool mobileNumberValidate = false;

  late TextEditingController doctorNameId;
  late TextEditingController mobileNumberId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;
    mobileNumberValidate = false;

    doctorNameId = new TextEditingController();
    mobileNumberId = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UavPrimaryColor,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200.0,
                ),
                // Image Container
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      child: Image.asset(
                        'assets/images/login.png',
                        height: 60.0,  // Set the height of the image
                        width: 60.0,   // Set the width of the image
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // To minimize the height of the Column
                        children: <Widget>[
                          Text(
                            "Patient Registration",
                            textAlign: TextAlign.center,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 200,
                            alignment: Alignment.center,
                            child: Divider(
                              color: Color(0xff6200ee),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  width: double.infinity,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Form(
                                  key: _formKey,
                                  autovalidateMode: _autoValidate,
                                  child: Column(children: <Widget>[
                                    TextFormField(
                                      controller: doctorNameId,
                                      maxLength: 30,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyText2,
                                      decoration: InputDecoration(
                                        counter: Offstage(),
                                        hintText: 'Patient Name',
                                        labelText: 'Patient Name',
                                        prefixIcon: const Icon(
                                          Icons.drive_file_rename_outline,
                                          color: Colors.grey,
                                        ),
                                        prefixText: ' ',
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 20.0, horizontal: 20.0),
                                      ),
                                      validator: (value) =>
                                          validateRequiredField(value),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: mobileNumberId,
                                      maxLength: 10,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyText2,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        counter: Offstage(),
                                        hintText: 'Mobile Number',
                                        labelText: 'Mobile Number',
                                        prefixIcon: const Icon(
                                          Icons.phone,
                                          color: Colors.grey,
                                        ),
                                        prefixText: ' ',
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 20.0, horizontal: 20.0),
                                      ),
                                      validator: (value) =>
                                          validateMobileNumber(value!),
                                    ),
                                  ])),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      minWidth: double.infinity),
                                  child: ElevatedButton(
                                    onPressed: () =>
                                    {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        patientRegistrationSendOTP(context)
                                      }
                                    },
                                    child: Text("Send OTP",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .button!
                                            .copyWith(
                                          color: Colors.white,
                                        )),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ]),
    );
  }

  void patientRegistrationSendOTP(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    Registration registration = Registration(mobile: mobileNumberId.text);
    CheckPatientRegistrationReqeustVO checkPatientRegistrationRequestVO = CheckPatientRegistrationReqeustVO(
        registration: registration);


    print("patientRegistrationSendOTP_data ___" +
        checkPatientRegistrationRequestVO.toJson().toString());
    Future<CheckPatientRegistrationResponseVO?> response = API
        .checkPatient(checkPatientRegistrationRequestVO);
    response.catchError(
          (onError) {
        print(onError.toString());
        showAlertDialog(
            context: context,
            btnNameOk: "ok",
            btnNameCancel: null,
            title: "Oops! ",
            message: onError.toString());
      },
    ).then((value) async {
      if (value != null && value.success == "0") {
        Navigator.pushNamed(
            context,
            UavRoutes
                .Patient_registration_details_Screen, arguments: {
          "name": doctorNameId.text,
          "mobile": mobileNumberId.text
        });
      } else {
        showAlertDialog(
            context: context,
            btnNameOk: "ok",
            btnNameCancel: null,
            title: "Oops! ",
            message: value!.message!);
      }
    }).whenComplete(() {
      print("called when future completes");
      EasyLoading.dismiss();
    });
  }
}
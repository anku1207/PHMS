import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/CheckDoctorRegistrationRequestVO.dart';
import 'package:phms/PHMS/model/response_model/CheckDoctorRegistrationResponse.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;


class DoctorRegistrationScreen extends StatefulWidget {
  @override
  State<DoctorRegistrationScreen> createState() =>
      _DoctorRegistrationScreenState();
}

class _DoctorRegistrationScreenState extends State<DoctorRegistrationScreen> {
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
                Container(
                    width: double.infinity,
                    height: 200.0,
                    child: new Container(
                      height: 150.0,
                      width: 150.0,
                      child: new Image.asset('assets/images/login.png'),)
                ),
                Positioned.fill(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // To minimize the height of the Column
                        children: <Widget>[
                          Text(
                            "Doctor Registration",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1!.copyWith(
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
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Doctor Name',
                                    labelText: 'Doctor Name',
                                    prefixIcon: const Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.grey,
                                    ),
                                    prefixText: ' ',
                                    contentPadding: new EdgeInsets.symmetric(
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
                                  style: Theme.of(context).textTheme.bodyText1,
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
                                    contentPadding: new EdgeInsets.symmetric(
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
                                onPressed: () => {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    doctorRegistrationSendOTP(context)
                                  }

                                },
                                child: Text("Send OTP",
                                    style: Theme.of(context).textTheme.button!.copyWith(
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

  void doctorRegistrationSendOTP(BuildContext context){
    Registration registration = Registration(mobile:mobileNumberId.text);
    CheckDoctorRegistrationRequestVO checkDoctorRegistrationRequestVO = CheckDoctorRegistrationRequestVO(registration: registration);


    print("doctorRegister_data ___" + checkDoctorRegistrationRequestVO.toJson().toString());
    Future<CheckDoctorRegistrationResponse?> categoryListResponse =API.checkDoctor(checkDoctorRegistrationRequestVO);
    categoryListResponse.catchError(
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
      if (value != null && value.success=="0")  {
        Navigator.pushNamed(
            context,
            UavRoutes
                .Doctor_Registration_Details_Screen);
      }else{
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/PatientRegistrationRequestVO.dart';
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';
import 'package:phms/PHMS/model/response_model/PatientRegistrationResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;

class PatientRegistrationDetailsScreen extends StatefulWidget {
  final Object argument;
  PatientRegistrationDetailsScreen({Key? key, required this.argument}) : super(key: key);
  @override
  State<PatientRegistrationDetailsScreen> createState() =>
      _PatientRegistrationDetailsScreenState();
}

class _PatientRegistrationDetailsScreenState extends State<PatientRegistrationDetailsScreen> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  var argumentsMap;
  bool _isHidden = true;


  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController otpController;
  late TextEditingController dobController;


  late String gender;
  final List<String> genderList = [
    'Male',
    'Female',
  ];

  late String city;
  final List<String> cityList = [
    'Ahmedabad',
    'Rajsthan',
    'Mumbai',
    'Kolkata',
    'Bengaluru',
    'Pune',
    'Kochi',
    'Jaipur'
  ];

  late String bloodGroup;
  final List<String> bloodGroupList = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];


  FocusNode _dropdownFocus = FocusNode();



  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;

    argumentsMap = widget.argument as Map;


    // Create controllers for each TextFormField
    nameController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    otpController = TextEditingController();
    dobController=TextEditingController();

    nameController.text=argumentsMap["name"];
    mobileController.text=argumentsMap["mobile"];
    otpController.text=generateRandom4DigitNumber().toString();

    gender=genderList[0];
    city=cityList[0];
    bloodGroup=bloodGroupList[0];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _dropdownFocus.dispose();

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
                        mainAxisSize: MainAxisSize.min, // To minimize the height of the Column
                        children: <Widget>[
                          Text(
                            "Patient Registration Details",
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
              flex: 1,
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
                                  controller: nameController,
                                  maxLength: 30,
                                  readOnly: false,
                                  enabled: false,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Patient Name',
                                    labelText: 'Patient Name',
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
                                  controller: mobileController,
                                  maxLength: 30,
                                  readOnly: false,
                                  enabled: false,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Mobile Number',
                                    labelText: 'Mobile Number',
                                    prefixIcon: const Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.grey,
                                    ),
                                    prefixText: ' ',
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                  ),
                                  validator: (value) =>
                                      validateMobileNumber(value!),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: _isHidden,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    prefixText: ' ',
                                    suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(
                                        _isHidden
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                    ),
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
                                  controller: emailController,
                                  maxLength: 50,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Email',
                                    labelText: 'Email',
                                    prefixIcon: const Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.grey,
                                    ),
                                    prefixText: ' ',
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                  ),
                                  validator: (value) =>
                                      validateEmail(value!),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                dropDownLayout(context,
                                    gender,
                                    genderList,
                                        (selectVal) {
                                      setState(() {
                                        gender = selectVal;
                                        FocusScope.of(context).requestFocus(_dropdownFocus);

                                      });
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  maxLength: 50,
                                  controller: addressController,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Address',
                                    labelText: 'Address',
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
                                dropDownLayout(context,
                                    city,
                                    cityList,
                                        (selectVal) {
                                      setState(() {
                                        city = selectVal;
                                        FocusScope.of(context).requestFocus(_dropdownFocus);

                                      });
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: dobController,
                                  maxLength: 30,
                                  readOnly: true,
                                  showCursor: false,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  onTap: () {
                                    showDateDialog(context).then((value) {
                                      if (value != null) {
                                        dobController.text = DateFormat('yyy-MM-dd').format(value);
                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'DOB',
                                    labelText: 'DOB',
                                    prefixIcon: const Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.grey,
                                    ),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                  ),
                                  validator: (value) =>
                                      validateRequiredField(value),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                dropDownLayout(context,
                                    bloodGroup,
                                    bloodGroupList,
                                        (selectVal) {
                                      setState(() {
                                        bloodGroup = selectVal;
                                        FocusScope.of(context).requestFocus(_dropdownFocus);

                                      });
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: otpController,
                                  readOnly: false,
                                  enabled: false,
                                  maxLength: 6,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'OTP',
                                    labelText: 'OTP',
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
                              ])),
                          SizedBox(
                            height: 20,
                          ),
                          ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: ElevatedButton(
                                onPressed: () => {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    patientRegistration(context)
                                  }
                                },
                                child: Text("Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
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
    ));
  }

  patientRegistration(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    Registration registration = Registration(patientname: nameController.text,mobile: mobileController.text
    ,email: emailController.text,location: "123",dob: dobController.text,bloodgrp: bloodGroup,doctorname: "",
    doctornumber: "",address: addressController.text ,gender: gender,password: passwordController.text);

    PatientRegistrationRequestVO patientRegistrationRequestVO = PatientRegistrationRequestVO(registration: registration);


    print("patientRegistration_data ___" +
        patientRegistrationRequestVO.toJson().toString());
    Future<PatientDetailsResponseVO?> response = API
        .registerPatient(patientRegistrationRequestVO);
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
      if (value != null && value.success == "1") {
        showToastShortTime(context, value.message!);
        Navigator.pushNamedAndRemoveUntil(
          context,
          UavRoutes.Login_Screen,
              (route) => false,
        );
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

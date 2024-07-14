import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/DoctorRegistrationVO.dart';
import 'package:phms/PHMS/model/response_model/DoctorRegisterResVO.dart';
import 'package:phms/PHMS/model/response_model/QualificationResModel.dart';
import 'package:phms/PHMS/model/response_model/RegistrationArgs.dart';
import 'package:phms/PHMS/model/response_model/SpecialitiesListResVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;

class DoctorRegistrationDetailsScreen extends StatefulWidget {
  final Object argument;

  DoctorRegistrationDetailsScreen({Key? key, required this.argument})
      : super(key: key);

  @override
  State<DoctorRegistrationDetailsScreen> createState() =>
      _DoctorRegistrationDetailsScreenState();
}

class _DoctorRegistrationDetailsScreenState
    extends State<DoctorRegistrationDetailsScreen> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  bool mobileNumberValidate = false;
  var argumentsMap;

  // Create controllers for each TextFormField
  late TextEditingController doctorNameController;
  late TextEditingController mobileController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController landlineController;
  late TextEditingController regNumberController;
  late TextEditingController otpController;
  late DoctorRegistrationVO doctorRegistrationVO;
  bool _isHidden = true;

  late String specialization;
  late String qualification;
  final List<String> specializationList = [];

  final List<String> qualificationList = [];
  FocusNode _dropdownFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _dropdownFocus.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    argumentsMap = widget.argument as Map;

    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;
    mobileNumberValidate = false;
    specialization = "Choose specialization";
    qualification = "Choose qualification";

    // Create controllers for each TextFormField
    doctorNameController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    landlineController = TextEditingController();
    regNumberController = TextEditingController();
    otpController = TextEditingController();

    doctorRegistrationVO = DoctorRegistrationVO();

    doctorNameController.text = argumentsMap["doctor_name"];
    mobileController.text = argumentsMap["doctor_mobile"];
    otpController.text = generateRandom4DigitNumber().toString();

    Future.delayed(Duration.zero, () {
      _getSpecialitiesQualificationList(context);
    });
  }

  _getSpecialitiesQualificationList(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    print("_getSpecialitiesQualificationList ___" + "");
    Future<SpecialitiesListResVO?> specialitiesListResVO =
        API.getSpecialitiesList();

    Future<QualificationResModel?> qualificationResVO =
        API.getQualificationList();

    Future.wait([specialitiesListResVO, qualificationResVO]).then((results) {
      final specialitiesListResult = results[0] as SpecialitiesListResVO?;
      final qualificationListResult = results[1] as QualificationResModel?;

      if (specialitiesListResult != null &&
          specialitiesListResult.success == "1") {
        setState(() {
          specialitiesListResult.data!.forEach((specializationData) {
            specializationList.add(specializationData.speciality!);
          });
        });
      } else if (specialitiesListResult != null) {
        showAlertDialog(
            context: context,
            btnNameOk: "Ok",
            btnNameCancel: null,
            title: "Oops! ",
            message: specialitiesListResult.message!);
      }

      if (qualificationListResult != null &&
          qualificationListResult.success == "1") {
        setState(() {
          qualificationListResult.data!.forEach((qualificationData) {
            qualificationList.add(qualificationData.qualification!);
          });
        });
        // Handle anotherListResult similarly
      } else if (qualificationListResult != null) {
        showAlertDialog(
            context: context,
            btnNameOk: "Ok",
            btnNameCancel: null,
            title: "Oops! ",
            message: qualificationListResult.message!);
      }
    }).catchError((onError) {
      print(onError.toString());
      showToastShortTime(context, onError.toString());
    }).whenComplete(() {
      print("called when future completes");
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    Registration registration;
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
                        height: 60.0, // Set the height of the image
                        width: 60.0, // Set the width of the image
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
                            "Doctor Details",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
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
                                  controller: doctorNameController,
                                  maxLength: 100,
                                  enabled: false,
                                  // Set to false to make it read-only
                                  readOnly: true,
                                  // Set to true to remove the cursor
                                  style: Theme.of(context).textTheme.bodyText2,
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
                                  controller: mobileController,
                                  maxLength: 10,
                                  enabled: false,
                                  // Set to false to make it read-only
                                  readOnly: true,
                                  // Set to true to remove the cursor
                                  keyboardType: TextInputType.number,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Mobile Number',
                                    labelText: 'Mobile Number',
                                    prefixIcon: const Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.grey,
                                    ),
                                    prefixText: '+91 ',
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
                                  validator: (value) => validateEmail(value!),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: regNumberController,
                                  maxLength: 50,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Registration Number',
                                    labelText: 'Registration Number',
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
                                    controller: landlineController,
                                    maxLength: 50,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      counter: Offstage(),
                                      hintText: 'Landline',
                                      labelText: 'Landline',
                                      prefixIcon: const Icon(
                                        Icons.drive_file_rename_outline,
                                        color: Colors.grey,
                                      ),
                                      prefixText: ' ',
                                      contentPadding: new EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 20.0),
                                    ),
                                    validator: (value) => null
                                    //validateRequiredField(value),
                                    ),
                                SizedBox(
                                  height: 20,
                                ),
                                dropDownLayout(
                                    context, qualification, qualificationList,
                                    (selectVal) {
                                  setState(() {
                                    qualification = selectVal;
                                    FocusScope.of(context)
                                        .requestFocus(_dropdownFocus);
                                  });
                                }),
                                SizedBox(
                                  height: 20,
                                ),
                                dropDownLayout(
                                    context, specialization, specializationList,
                                    (selectVal) {
                                  setState(() {
                                    specialization = selectVal;
                                    FocusScope.of(context)
                                        .requestFocus(_dropdownFocus);
                                  });
                                }),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: otpController,
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
                                  if (qualificationList.isNotEmpty &&
                                      !qualificationList
                                          .contains(qualification))
                                    {
                                      showToastShortTime(context,
                                          "please select qualification")
                                    }
                                  else if (specializationList.isNotEmpty &&
                                      !specializationList
                                          .contains(specialization))
                                    {
                                      showToastShortTime(context,
                                          "please select specialization")
                                    }
                                  else
                                    {
                                      if (_formKey.currentState?.validate() ??
                                          false)
                                        {
                                          registration = Registration(
                                            doctorname:
                                                doctorNameController.text,
                                            mobile: mobileController.text,
                                            password: passwordController.text,
                                            email: emailController.text,
                                            landline: landlineController.text,
                                            qualification: qualification,
                                            specialisation: specialization,
                                            regNumber: regNumberController.text,
                                          ),
                                          doctorRegister(context,registration)
                                        }
                                    }
                                },
                                child: Text("Next",
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
    );
  }


  void doctorRegister(BuildContext context, Registration registration) {
    FocusScope.of(context).requestFocus(FocusNode());

    DoctorRegistrationVO doctorRegistrationVO =
    DoctorRegistrationVO(registration: registration);

    print("doctorRegister_data ___" + doctorRegistrationVO.toJson().toString());
    Future<DoctorRegisterResVO?> doctorRegistrationResVO =
    API.registerDoctor(doctorRegistrationVO);
    doctorRegistrationResVO.catchError(
          (onError) {
        print(onError.toString());
        showToastShortTime(context, onError.toString());
      },
    ).then((value) {
      if (value != null) {
        if (value.success == "1") {
          showToastShortTime(context, value.message!);

          registration.setDoctorID(value.doctorID!);
          Navigator.pushNamed(
              context,
              UavRoutes
                  .Doctor_Registration_Hospital_Details_Screen,
              arguments: RegistrationArgs(
                registration,  // Your Registration object
                value.doctorID!,  // The doctorId value
              ));

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

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

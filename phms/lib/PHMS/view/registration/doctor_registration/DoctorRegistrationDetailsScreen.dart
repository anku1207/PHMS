import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/model/DoctorRegistrationVO.dart';

class DoctorRegistrationDetailsScreen extends StatefulWidget {
  @override
  State<DoctorRegistrationDetailsScreen> createState() =>
      _DoctorRegistrationDetailsScreenState();
}

class _DoctorRegistrationDetailsScreenState
    extends State<DoctorRegistrationDetailsScreen> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  bool mobileNumberValidate = false;

  // Create controllers for each TextFormField
  late TextEditingController doctorNameController;
  late TextEditingController mobileController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController landlineController;
  late TextEditingController qualificationController;
  late TextEditingController specializationController;
  late TextEditingController regNumberController;
  late DoctorRegistrationVO doctorRegistrationVO;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;
    mobileNumberValidate = false;

    // Create controllers for each TextFormField
    doctorNameController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    landlineController = TextEditingController();
    qualificationController = TextEditingController();
    specializationController = TextEditingController();
    regNumberController = TextEditingController();

    doctorRegistrationVO=DoctorRegistrationVO();

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
                            "Doctor Details",
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
                                  controller: doctorNameController,
                                  maxLength: 100,
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
                                  controller: mobileController,
                                  maxLength: 50,
                                  keyboardType: TextInputType.number,
                                  style: Theme.of(context).textTheme.bodyText1,
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
                                  maxLength: 50,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Password',
                                    labelText: 'Password',
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
                                  controller: emailController,
                                  maxLength: 50,
                                  style: Theme.of(context).textTheme.bodyText1,
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
                                      validateRequiredField(value),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: landlineController,
                                  maxLength: 50,
                                  style: Theme.of(context).textTheme.bodyText1,
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
                                  validator: (value) =>
                                      validateRequiredField(value),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: qualificationController,
                                  maxLength: 50,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Qualification',
                                    labelText: 'Qualification',
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
                                  controller: specializationController,
                                  maxLength: 50,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Specialization',
                                    labelText: 'Specialization',
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
                                  controller: regNumberController,
                                  maxLength: 50,
                                  style: Theme.of(context).textTheme.bodyText1,
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
                              ])),
                          SizedBox(
                            height: 20,
                          ),
                          ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: ElevatedButton(
                                onPressed: () => {
                                if (_formKey.currentState?.validate() ?? false) {
                                    registration = Registration(
                                    doctorname: doctorNameController.text,
                                    mobile: mobileController.text,
                                    password: passwordController.text,
                                    email: emailController.text,
                                    landline: landlineController.text,
                                    qualification: qualificationController.text,
                                    specialisation: specializationController.text,
                                    regNumber: regNumberController.text,
                                    ),
                                    Navigator.pushNamed(
                                    context,
                                      UavRoutes
                                            .Doctor_Registration_Hospital_Details_Screen,
                                      arguments: registration
                                    )
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
}

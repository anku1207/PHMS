import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';

class PatientRegistrationScreen extends StatefulWidget {
  @override
  State<PatientRegistrationScreen> createState() =>
      _PatientRegistrationScreenState();
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
                            "Patient Registration",
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
                                  controller: doctorNameId,
                                  maxLength: 30,
                                  style: Theme.of(context).textTheme.bodyText1,
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
                                      validateRequiredField(value),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: doctorNameId,
                                  maxLength: 30,
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
                                  controller: doctorNameId,
                                  maxLength: 30,
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
                                  controller: doctorNameId,
                                  maxLength: 30,
                                  style: Theme.of(context).textTheme.bodyText1,
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
                                  controller: doctorNameId,
                                  maxLength: 30,
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
                                  controller: doctorNameId,
                                  maxLength: 30,
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
                                  Navigator.pushNamed(
                                      context,
                                      UavRoutes
                                          .Doctor_Registration_Hospital_Details_Screen)
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

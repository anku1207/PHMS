import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart' as Constants;
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';

class PatientCaseRegisterScreen_2 extends StatefulWidget {
  late final Data argument;

  PatientCaseRegisterScreen_2({required this.argument});

  @override
  State<PatientCaseRegisterScreen_2> createState() =>
      _PatientCaseRegisterScreen_2State();
}

class _PatientCaseRegisterScreen_2State
    extends State<PatientCaseRegisterScreen_2> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  bool mobileNumberValidate = false;

  // Create controllers for each TextFormField
  late TextEditingController mobileController;
  late TextEditingController patientIdController;
  late TextEditingController patientNameController;
  late TextEditingController bloodGroupController;
  late TextEditingController dobController;

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    mobileController.dispose();
    patientIdController.dispose();
    patientNameController.dispose();
    bloodGroupController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;
    mobileNumberValidate = false;

    mobileController = TextEditingController();
    patientIdController = TextEditingController();
    patientNameController = TextEditingController();
    bloodGroupController = TextEditingController();
    dobController = TextEditingController();

    mobileController.text = widget.argument.mobile!;
    patientIdController.text = widget.argument.patientID!;
    patientNameController.text = widget.argument.patientname!;
    bloodGroupController.text = widget.argument.bloodgroup!;
    dobController.text = widget.argument.bloodgroup!;
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
              "Dashboard",
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
                                      "Patient Medical Case",
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
                              SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 20.0, right: 20.0),
                                child: Form(
                                  key: _formKey,
                                  autovalidateMode: AutovalidateMode.always,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: mobileController,
                                        maxLength: 10,
                                        keyboardType: TextInputType.number,
                                        readOnly: true,
                                        enabled: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          hintText: 'Mobile Number',
                                          labelText: 'Mobile Number',
                                          prefixIcon: const Icon(
                                            Icons.drive_file_rename_outline,
                                            color: Colors.grey,
                                          ),
                                          prefixText: '+91 ',
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 20.0,
                                          ),
                                        ),
                                        validator: (value) =>
                                            validateMobileNumber(value!),
                                      ),
                                      SizedBox(height: 20),
                                      TextFormField(
                                        controller: patientIdController,
                                        maxLength: 10,
                                        readOnly: true,
                                        enabled: false,
                                        keyboardType: TextInputType.number,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          hintText: 'Patient Id',
                                          labelText: 'Patient Id',
                                          prefixIcon: const Icon(
                                            Icons.drive_file_rename_outline,
                                            color: Colors.grey,
                                          ),
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 20.0,
                                          ),
                                        ),
                                        validator: (value) =>
                                            validateRequiredField(value!),
                                      ),
                                      SizedBox(height: 20),
                                      TextFormField(
                                        controller: patientNameController,
                                        maxLength: 30,
                                        readOnly: true,
                                        enabled: false,
                                        style: Theme.of(context)
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
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 20.0,
                                          ),
                                        ),
                                        validator: (value) =>
                                            validateRequiredField(value),
                                      ),
                                      SizedBox(height: 20),
                                      TextFormField(
                                        controller: bloodGroupController,
                                        maxLength: 30,
                                        readOnly: true,
                                        enabled: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          hintText: 'Patient Blood Group',
                                          labelText: 'Patient Blood Group',
                                          prefixIcon: const Icon(
                                            Icons.drive_file_rename_outline,
                                            color: Colors.grey,
                                          ),
                                          prefixText: ' ',
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 20.0,
                                          ),
                                        ),
                                        validator: (value) =>
                                            validateRequiredField(value),
                                      ),
                                      SizedBox(height: 20),
                                      TextFormField(
                                        controller: dobController,
                                        maxLength: 30,
                                        readOnly: true,
                                        enabled: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          hintText: 'Patient DOB',
                                          labelText: 'Patient DOB',
                                          prefixIcon: const Icon(
                                            Icons.drive_file_rename_outline,
                                            color: Colors.grey,
                                          ),
                                          prefixText: ' ',
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 20.0,
                                          ),
                                        ),
                                        validator: (value) =>
                                            validateRequiredField(value),
                                      ),
                                      SizedBox(height: 20),
                                      ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            minWidth: double.infinity),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              Navigator.pushNamed(context, UavRoutes.Patient_case_register_screen_3,
                                                  arguments: widget.argument);                                            }
                                          },
                                          child: Text(
                                            "Next",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ),
          )),
    );
  }

}

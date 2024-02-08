import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart' as Constants;
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/PatientDetailsRequestVO.dart';
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;

class PatientHistoryScreen_1 extends StatefulWidget {
  late final Object argument;

  PatientHistoryScreen_1({required this.argument});

  @override
  State<PatientHistoryScreen_1> createState() => _PatientHistoryScreen_1State();
}

class _PatientHistoryScreen_1State extends State<PatientHistoryScreen_1> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  bool mobileNumberValidate = false;
  var argumentsMap;

  // Create controllers for each TextFormField
  late TextEditingController mobileController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    argumentsMap = widget.argument as Map;

    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;
    mobileNumberValidate = false;
    mobileController = TextEditingController();
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
                    padding: const EdgeInsets.only(left: 0, right: 0),
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
                                            controller: mobileController,
                                            maxLength: 10,
                                            keyboardType: TextInputType.number,
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
                                                  horizontal: 20.0),
                                            ),
                                            validator: (value) =>
                                                validateMobileNumber(value!),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  minWidth: double.infinity),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (_formKey.currentState
                                                      ?.validate() ??
                                                      false) {
                                                    getPatientByMobile(context,
                                                        mobileController.text);
                                                  }
                                                },
                                                child: Text("Show",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    )),
                                              )),
                                        ],
                                      ),
                                    ))
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

  void getPatientByMobile(BuildContext context, String mobileNumber) {
    FocusScope.of(context).requestFocus(FocusNode());
    Case casee = Case(mobile: mobileNumber);
    PatientDetailsRequestVO patientDetailsRequestVO =
    PatientDetailsRequestVO(casee: casee);
    print("getPatientByMobile_data ___" +
        patientDetailsRequestVO.toJson().toString());
    Future<PatientDetailsResponseVO?> getPatientByMobileResponse =
    API.getPatientDetails(patientDetailsRequestVO);
    getPatientByMobileResponse.catchError(
          (onError) {
        print(onError.toString());
        showToastShortTime(context, onError.toString());
      },
    ).then((value) {
      if (value != null) {
        if (value.success == "1") {
          Navigator.pushNamed(context, UavRoutes.Patient_history_screen_2,
              arguments: value.data![0]);
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
}

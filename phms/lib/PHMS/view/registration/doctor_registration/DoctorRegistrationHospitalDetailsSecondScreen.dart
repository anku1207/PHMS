import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/DoctorRegistrationVO.dart';
import 'package:phms/PHMS/model/response_model/DoctorRegistrationResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;

class DoctorRegistrationHospitalDetailsSecondScreen extends StatefulWidget {
  late final Registration argument;

  DoctorRegistrationHospitalDetailsSecondScreen({required this.argument});

  @override
  State<DoctorRegistrationHospitalDetailsSecondScreen> createState() =>
      _DoctorRegistrationHospitalDetailsSecondScreen();
}

class _DoctorRegistrationHospitalDetailsSecondScreen
    extends State<DoctorRegistrationHospitalDetailsSecondScreen> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;

  late final TextEditingController doctorAssociationController;
  late final TextEditingController startTimeController;
  late final TextEditingController endTimeController;

  TimeOfDay? startTime;
  TimeOfDay? endTime;

  late TextEditingController doctorNameId;
  late TextEditingController mobileNumberId;

  List<String> operatingDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
  List<int> selectedOperatingDays = [];

  void doctorRegister(BuildContext context, Registration registration) {
    DoctorRegistrationVO doctorRegistrationVO =
        DoctorRegistrationVO(registration: registration);

    print("doctorRegister_data ___" + doctorRegistrationVO.toJson().toString());
    Future<DoctorRegistrationResponseVO?> categoryListResponse =
        API.registerDoctor(doctorRegistrationVO);
    categoryListResponse.catchError(
      (onError) {
        print(onError.toString());
        showToastShortTime(context, onError.toString());
      },
    ).then((value) {
      if (value != null) {
        if (value.success == "1") {
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
              message: value.message!);
        }
      }
    }).whenComplete(() {
      print("called when future completes");
      EasyLoading.dismiss();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;

    doctorAssociationController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Place place;
    return Scaffold(
      backgroundColor: UavPrimaryColor,
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: 200.0,
                  child: new Container(
                    height: 150.0,
                    width: 150.0,
                    child: new Image.asset('assets/images/login.png'),
                  )),
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
                          "Hospital Details Second",
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
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            autovalidateMode: _autoValidate,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: doctorAssociationController,
                                  maxLength: 50,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Doctor Association',
                                    labelText: 'Doctor Association',
                                    prefixIcon: const Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Colors.grey,
                                    ),
                                    prefixText: ' ',
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 20.0,
                                    ),
                                  ),
                                  validator: (value) =>
                                      validateRequiredField(value),
                                ),
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Operating Days",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                // Operating days GridView
                                GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio:
                                        3.0, // Adjust this ratio to control the height
                                  ),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // Disable scrolling
                                  padding: EdgeInsets.zero,
                                  // Remove GridView padding
                                  itemCount: operatingDays.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (selectedOperatingDays
                                              .contains(index)) {
                                            selectedOperatingDays.remove(index);
                                          } else {
                                            selectedOperatingDays.add(index);
                                          }
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(0),
                                        // Remove any margin around the container
                                        padding: EdgeInsets.all(0),
                                        // Remove any padding within the container
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: selectedOperatingDays
                                                  .contains(index),
                                              onChanged: (value) {
                                                setState(() {
                                                  if (value ?? false) {
                                                    selectedOperatingDays
                                                        .add(index);
                                                  } else {
                                                    selectedOperatingDays
                                                        .remove(index);
                                                  }
                                                });
                                              },
                                            ),
                                            Text(
                                              operatingDays[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Operating HRS",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: startTimeController,
                                        maxLength: 50,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          hintText: 'Start Time',
                                          labelText: 'Start Time',
                                          prefixIcon: const Icon(
                                            Icons.more_time,
                                            color: Colors.grey,
                                          ),
                                          prefixText: ' ',
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 20.0,
                                          ),
                                        ),
                                        onTap: () async {
                                          // Show time picker for start time
                                          TimeOfDay? selectedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime:
                                                startTime ?? TimeOfDay.now(),
                                          );

                                          // If the user selects a time, update the start time
                                          if (selectedTime != null) {
                                            setState(() {
                                              startTime = selectedTime;
                                              startTimeController.text =
                                                  startTime!.format(context);
                                            });
                                          }
                                        },
                                        validator: (value) =>
                                            validateRequiredField(value),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    // Adjust the width as needed for spacing
                                    Expanded(
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: endTimeController,
                                        maxLength: 50,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          hintText: 'End Time',
                                          labelText: 'End Time',
                                          prefixIcon: const Icon(
                                            Icons.more_time,
                                            color: Colors.grey,
                                          ),
                                          prefixText: ' ',
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 20.0,
                                          ),
                                        ),
                                        onTap: () async {
                                          // Show time picker for end time
                                          TimeOfDay? selectedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime:
                                                endTime ?? TimeOfDay.now(),
                                          );

                                          // If the user selects a time, update the end time
                                          if (selectedTime != null) {
                                            setState(() {
                                              endTime = selectedTime;
                                              endTimeController.text =
                                                  selectedTime.format(context);
                                            });
                                          }
                                        },
                                        validator: (value) =>
                                            validateRequiredField(value),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: double.infinity),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  // Use the selectedOperatingDays list as needed
                                  if (selectedOperatingDays.isNotEmpty) {
                                    selectedOperatingDays.sort();
                                    var operatingDays1 = "";

                                    for (int value in selectedOperatingDays) {
                                      // Your code here, using 'value'
                                      if (operatingDays1.isEmpty) {
                                        operatingDays1 = operatingDays[value];
                                      } else {
                                        operatingDays1 +=
                                            "-" + operatingDays[value];
                                      }
                                    }
                                    print(operatingDays1);
                                    place = Place(
                                        placename:
                                            doctorAssociationController.text,
                                        visitingdays: operatingDays1,
                                        visitinghrs: startTimeController.text +
                                            " - " +
                                            endTimeController.text,
                                        address: "ahmedabad",
                                        doctorid: "1",
                                        mobile: "9586582649",
                                        placetype: "1",
                                        email:"",
                                    landline: "");
                                    if (widget.argument.place!.length == 2) {
                                      widget.argument.place!.removeAt(1);
                                    }
                                    widget.argument.place!.add(place);

                                    doctorRegister(context, widget.argument);
                                  } else {
                                    showToastShortTime(
                                        context, "Selected Operating Days");
                                  }
                                }
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
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

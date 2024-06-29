import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phms/PHMS/components/DateTimePickerFormField.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/CaseRegRequestVO.dart' as CaseRegRequest;
import 'package:phms/PHMS/model/response_model/CaseRegResponseVO.dart' as CaseRegResponse;
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart' as Login;
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;
import 'package:phms/PHMS/components/constants.dart' as Constants;

class PatientCaseRegisterScreen_3 extends StatefulWidget {
  late final Data argument;

  PatientCaseRegisterScreen_3({required this.argument});

  @override
  State<PatientCaseRegisterScreen_3> createState() =>
      _PatientCaseRegisterScreen_3State();
}

class _PatientCaseRegisterScreen_3State
    extends State<PatientCaseRegisterScreen_3> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  bool mobileNumberValidate = false;
  var argumentsMap;
  bool isChecked = false;

  late ImagePicker _imagePicker;
  PickedFile? _pickedImage;

  // Create controllers for each TextFormField
  late TextEditingController symptomsController ;
  late TextEditingController prescriptionController;
  late TextEditingController notesController ;
  late TextEditingController dateAndTimeController ;
  late TextEditingController reasonController ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _imagePicker = ImagePicker();

    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;
    mobileNumberValidate = false;
    symptomsController = TextEditingController();
    prescriptionController = TextEditingController();
    notesController = TextEditingController();
    dateAndTimeController=TextEditingController();
    reasonController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    symptomsController.dispose();
    prescriptionController.dispose();
    notesController.dispose();
    dateAndTimeController.dispose();
    reasonController.dispose();

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
              "Case Register",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body:Container(
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
                                    child: Image.asset("assets/images/viewhistory.png"),
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
                                      style: Theme.of(context).textTheme.bodyText2,
                                      decoration: InputDecoration(
                                        counter: Offstage(),
                                        hintText: 'Patient Symptoms',
                                        labelText: 'Patient Symptoms',
                                        prefixIcon: const Icon(
                                          Icons.drive_file_rename_outline,
                                          color: Colors.grey,
                                        ),
                                        contentPadding: new EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 20.0),
                                      ),
                                      validator: (value) =>
                                          validateRequiredField(value!),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      maxLines: 1,
                                      controller: prescriptionController,
                                      keyboardType: TextInputType.text,
                                      style: Theme.of(context).textTheme.bodyText2,
                                      decoration: InputDecoration(
                                        counter: Offstage(),
                                        hintText: 'Patient Prescription',
                                        labelText: 'Patient Prescription',
                                        prefixIcon: const Icon(
                                          Icons.drive_file_rename_outline,
                                          color: Colors.grey,
                                        ),
                                        contentPadding: new EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 20.0),
                                      ),
                                      validator: (value) =>
                                          validateRequiredField(value!),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showImagePickerDialog(context,
                                                (selectedOption) {
                                              if (selectedOption == 'camera') {
                                                _getImageFromCamera();
                                              } else if (selectedOption == 'gallery') {
                                                _getImageFromGallery();
                                              }
                                            });
                                      },
                                      child: _pickedImage == null
                                          ? Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(3.0),
                                          border: Border.all(
                                            color: Constants.UavPrimaryColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            size: 80.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                          : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(3.0),
                                          border: Border.all(
                                            color: Constants.UavPrimaryColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Image.file(
                                          File(_pickedImage!.path),
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      maxLines: 1,
                                      controller: notesController,
                                      keyboardType: TextInputType.text,
                                      style: Theme.of(context).textTheme.bodyText2,
                                      decoration: InputDecoration(
                                        counter: Offstage(),
                                        hintText: 'Patient Notes',
                                        labelText: 'Patient Notes',
                                        prefixIcon: const Icon(
                                          Icons.drive_file_rename_outline,
                                          color: Colors.grey,
                                        ),
                                        contentPadding: new EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 20.0),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: isChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              isChecked = value ?? false;
                                            });
                                          },
                                        ),
                                        SizedBox(width: 8.0),
                                        Text('Patient Follow up'),
                                      ],
                                    ),

                                    Visibility(
                                      visible: isChecked,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10),
                                          CustomDateTimePickerFormField(dateAndTimeController,true),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            maxLines: 1,
                                            controller: reasonController,
                                            keyboardType: TextInputType.text,
                                            style: Theme.of(context).textTheme.bodyText2,
                                            decoration: InputDecoration(
                                              counter: Offstage(),
                                              hintText: 'Reason',
                                              labelText: 'Reason',
                                              prefixIcon: const Icon(
                                                Icons.drive_file_rename_outline,
                                                color: Colors.grey,
                                              ),
                                              contentPadding: new EdgeInsets.symmetric(
                                                  vertical: 20.0, horizontal: 20.0),
                                            ),
                                            validator: (value) =>
                                                validateRequiredField(value!),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            minWidth: double.infinity),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState?.validate() ??
                                                false) {

                                              caseRegister(context,widget.argument);

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

  void _setImage(PickedFile? pickedFile) {
    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    PickedFile? pickedFile =
        await _imagePicker.getImage(source: ImageSource.camera);
    _setImage(pickedFile);
    Navigator.pop(context); // Close the bottom sheet
  }

  Future<void> _getImageFromGallery() async {
    PickedFile? pickedFile =
        await _imagePicker.getImage(source: ImageSource.gallery);
    _setImage(pickedFile);
    Navigator.pop(context); // Close the bottom sheet
  }

  void getPatientByMobile(BuildContext context, String text) {}

  void caseRegister(BuildContext context, Data argument) {

    checkCustomerSession().then((value) {
      if (value != null) {
        print('Value before decoding: $value');
        Map<String, dynamic> data1 = jsonDecode(value);
        Login.Data data = Login.Data.fromJson(data1);
        String prescriptionImg="";

        if(_pickedImage!=null){
          prescriptionImg=convertImageToBase64(_pickedImage!);
        }
        String symptomsImageName="symptoms_${argument.patientID}_${data.userid}.jpg";
        String prescriptionImageName="prescription_${argument.patientID}_${data.userid}.jpg";
        String notesImageName="notes_${argument.patientID}_${data.userid}.jpg";


        CaseRegRequest.Case casee = CaseRegRequest.Case(doctorID: data.userid, patientID: argument.patientID,symptoms: symptomsController.text,prescription: prescriptionController.text,
            notes: notesController.text,followup: isChecked?"Y":"N",appointmentdatetime: dateAndTimeController.text,reason:reasonController.text
            ,appointmentID: "0",existingCaseID: "0",placeID: "5",scheduleID: "0"
        ,prescriptionPic: prescriptionImg,symptomsPic: "",notesPic: "",symptomsImg:symptomsImageName,prescriptionImg: prescriptionImageName,
        notesImg: notesImageName);

        CaseRegRequest.CaseRegRequestVO caseRegRequestVO = CaseRegRequest.CaseRegRequestVO(casee:casee);

        FocusScope.of(context).requestFocus(FocusNode());

        print("caseRegister_data ___" + caseRegRequestVO.toJson().toString());
        Future<CaseRegResponse.CaseRegResponseVO?> caseRegResponse =
        API.caseRegister(caseRegRequestVO);
        caseRegResponse.catchError(
              (onError) {
            print(onError.toString());
            showToastShortTime(context, onError.toString());
          },
        ).then((value) async {
          if (value != null) {
            if (value.success == "1") {
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

              /*showAlertDialogConfirmation(
                context: context,
                title: "Confirmation",
                message: value.message!,
                btnNameOk: "Yes",
                backBtn: true,
                onOkPressed: (result) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    UavRoutes.Dashboard_Screen,
                        (route) => false,
                  );
                },
              );*/
            } else {
              showResponseDialogCbsl(
                  context,
                  AlertDialogDesignResponseWise(
                      "Oops!", value.message!, "OK", false), (clickBtn) {
                Navigator.pop(context);
              },backBtn: false);
              /*showAlertDialog(
                  context: context,
                  btnNameOk: "Ok",
                  btnNameCancel: null,
                  title: "Oops! ",
                  message: value.message!);*/
            }
          }
        }).whenComplete(() {
          print("called when future completes");
          EasyLoading.dismiss();
        });

        //http://dev.connect.phmspro.com/Service1.svc/caseReg_Photos

      } else {

      }
    });

  }
}

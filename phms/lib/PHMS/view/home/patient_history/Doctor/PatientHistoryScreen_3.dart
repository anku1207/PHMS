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
import 'package:phms/PHMS/model/request_model/CaseDetailsRequestVO.dart';
import 'package:phms/PHMS/model/response_model/CaseDetialsResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CaseSummaryDoctorResponseVO.dart';

import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart' as Login;
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;
import 'package:phms/PHMS/components/constants.dart' as Constants;

class PatientHistoryScreen_3 extends StatefulWidget {
  late final String argument;

  PatientHistoryScreen_3({required this.argument});

  @override
  State<PatientHistoryScreen_3> createState() => _PatientHistoryScreen_3State();
}

class _PatientHistoryScreen_3State extends State<PatientHistoryScreen_3> {
  String patientName = "";
  CaseDetialsResponseVO caseDetialsResponseVO = CaseDetialsResponseVO();

  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  bool mobileNumberValidate = false;
  var argumentsMap;
  bool isChecked = false;

  late ImagePicker _imagePicker;
  PickedFile? _pickedImage;
  String? imageUrl;

  // Create controllers for each TextFormField
  late TextEditingController symptomsController;

  late TextEditingController prescriptionController;
  late TextEditingController notesController;

  late TextEditingController dateAndTimeController;

  late TextEditingController reasonController;

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
    dateAndTimeController = TextEditingController();
    reasonController = TextEditingController();

    Future.delayed(Duration.zero, () {
      getCaseDetails(context);
    });
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

  double getTextHeight(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    return textPainter.height;

  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double leftPadding = 0.0;
    double rightPadding = 0.0;

    double availableWidth = totalWidth - leftPadding - rightPadding;

    TextStyle patientNameStyle = Theme.of(context)
        .textTheme
        .button!
        .copyWith(fontWeight: FontWeight.bold);


    double patientNameTextHeight =
    (getTextHeight("A", patientNameStyle) + 20)*2;

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
                                    child: Image.asset(
                                        "assets/images/viewhistory.png"),
                                  ),
                                  Text(
                                    "Case Details",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        "Patient Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${patientName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: caseDetialsResponseVO.data !=
                                                    null &&
                                                caseDetialsResponseVO
                                                    .data!.isNotEmpty
                                            ? IntrinsicWidth(
                                                child: Container(
                                                  child: Table(
                                                    columnWidths: {
                                                      0: FixedColumnWidth(
                                                          availableWidth *
                                                              0.2),
                                                      1: FixedColumnWidth(
                                                          availableWidth * 0.2),
                                                      2: FixedColumnWidth(
                                                          availableWidth *
                                                              0.28),
                                                      3: FixedColumnWidth(
                                                          availableWidth * 0.3),
                                                    },
                                                    children: [
                                                      TableRow(
                                                        children: [
                                                          TableCell(
                                                              child: Container(
                                                            height:
                                                                patientNameTextHeight,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Constants
                                                                  .UavPrimaryColor,
                                                              border: Border(
                                                                right:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  // Set the color of the right border
                                                                  width:
                                                                      5.0, // Set the width of the right border
                                                                ),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          5.0,
                                                                      top:
                                                                          5.0),
                                                              child: Center(
                                                                child: Text(
                                                                  'Case No',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .button!
                                                                      .copyWith(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                          TableCell(
                                                            child: Container(
                                                              height:
                                                                  patientNameTextHeight,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Constants
                                                                    .UavPrimaryColor,
                                                                border: Border(
                                                                  right:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    // Set the color of the right border
                                                                    width:
                                                                        5.0, // Set the width of the right border
                                                                  ),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            5.0,
                                                                        top:
                                                                            5.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Date',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .button!
                                                                        .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          TableCell(
                                                            child: Container(
                                                              height:
                                                                  patientNameTextHeight,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Constants
                                                                    .UavPrimaryColor,
                                                                border: Border(
                                                                  right:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    // Set the color of the right border
                                                                    width:
                                                                        5.0, // Set the width of the right border
                                                                  ),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            5.0,
                                                                        top:
                                                                            5.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Patient\nName',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .button!
                                                                        .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          TableCell(
                                                            child: Container(
                                                              height:
                                                                  patientNameTextHeight,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Constants
                                                                    .UavPrimaryColor,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            5.0,
                                                                        top:
                                                                            5.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Mobile\nNumber',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .button!
                                                                        .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      for (var rowData
                                                          in caseDetialsResponseVO
                                                              .data!)
                                                        TableRow(
                                                          children: [
                                                            TableCell(
                                                              child: Container(
                                                                margin: EdgeInsets.only(top: 5.0, bottom: 5.0), // Set margin here
                                                                color: Color.fromRGBO(245, 245, 245, 1), // #F5F5F5
                                                                height: patientNameTextHeight,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '${rowData.caseID}',
                                                                      maxLines: 2, // Set maximum lines here
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Container(
                                                                margin: EdgeInsets.only(top: 5.0, bottom: 5.0), // Set margin here

                                                                color: Color.fromRGBO(245, 245, 245, 1), // #F5F5F5
                                                                height: patientNameTextHeight,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '${rowData.casedatetime}',
                                                                      maxLines: 2, // Set maximum lines here
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Container(

                                                                margin: EdgeInsets.only(top: 5.0, bottom: 5.0), // Set margin here

                                                                color: Color.fromRGBO(245, 245, 245, 1), // #F5F5F5
                                                                height: patientNameTextHeight,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '${rowData.patientname}',
                                                                      maxLines: 2, // Set maximum lines here
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Container(
                                                                margin: EdgeInsets.only(top: 5.0, bottom: 5.0), // Set margin here

                                                                color: Color.fromRGBO(245, 245, 245, 1), // #F5F5F5
                                                                height: patientNameTextHeight,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '${rowData.patientmobile}',
                                                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Center(
                                                child: Text(
                                                  'Data Not Found',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, left: 20.0, right: 20.0),
                                        child:caseDetialsResponseVO.data!=null ? Form(
                                          key: _formKey,
                                          autovalidateMode: _autoValidate,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                maxLines: 1,
                                                readOnly: true,
                                                enabled: false,
                                                controller: symptomsController,
                                                keyboardType:
                                                    TextInputType.text,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                                decoration: InputDecoration(
                                                  counter: Offstage(),
                                                  hintText: 'Patient Symptoms',
                                                  labelText: 'Patient Symptoms',
                                                  prefixIcon: const Icon(
                                                    Icons
                                                        .drive_file_rename_outline,
                                                    color: Colors.grey,
                                                  ),
                                                  contentPadding:
                                                      new EdgeInsets.symmetric(
                                                          vertical: 20.0,
                                                          horizontal: 20.0),
                                                ),
                                                validator: (value) =>
                                                    validateRequiredField(
                                                        value!),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                maxLines: 1,
                                                readOnly: true,
                                                enabled: false,
                                                controller:
                                                    prescriptionController,
                                                keyboardType:
                                                    TextInputType.text,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                                decoration: InputDecoration(
                                                  counter: Offstage(),
                                                  hintText:
                                                      'Patient Prescription',
                                                  labelText:
                                                      'Patient Prescription',
                                                  prefixIcon: const Icon(
                                                    Icons
                                                        .drive_file_rename_outline,
                                                    color: Colors.grey,
                                                  ),
                                                  contentPadding:
                                                      new EdgeInsets.symmetric(
                                                          vertical: 20.0,
                                                          horizontal: 20.0),
                                                ),
                                                validator: (value) =>
                                                    validateRequiredField(
                                                        value!),
                                              ),
                                              GestureDetector(
                                                  onTap: () {

                                                  },
                                                  child: _pickedImage == null &&
                                                          imageUrl == null
                                                      ? Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.0),
                                                            border: Border.all(
                                                              color: Constants
                                                                  .UavPrimaryColor,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            child: Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              size: 80.0,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        )
                                                      : imageUrl == null
                                                          ? Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Constants
                                                                      .UavPrimaryColor,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Image.file(
                                                                File(
                                                                    _pickedImage!
                                                                        .path),
                                                                width: 200.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            )
                                                          : Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Constants
                                                                      .UavPrimaryColor,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child:
                                                              Image.network(
                                                                imageUrl!,
                                                                width: 200.0,
                                                                height: 200.0,
                                                                fit: BoxFit.cover,
                                                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                                  if (loadingProgress == null) {
                                                                    // Image is fully loaded
                                                                    return child;
                                                                  } else {
                                                                    // Image is still loading, you can display a loading indicator or check loadingProgress
                                                                    return CircularProgressIndicator(
                                                                      value: loadingProgress.expectedTotalBytes != null
                                                                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                                                          : null,
                                                                    );
                                                                  }
                                                                },
                                                                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                                                  // Error occurred while loading the image
                                                                  return Container(
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          3.0),
                                                                      border: Border.all(
                                                                        color: Constants
                                                                            .UavPrimaryColor,
                                                                        width: 1.0,
                                                                      ),
                                                                    ),
                                                                    child: Container(
                                                                      width: 100.0,
                                                                      height: 100.0,
                                                                      child: Icon(
                                                                        Icons
                                                                            .camera_alt_outlined,
                                                                        size: 80.0,
                                                                        color:
                                                                        Colors.black,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            )),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                maxLines: 1,
                                                controller: notesController,
                                                readOnly: true,
                                                enabled: false,
                                                keyboardType:
                                                    TextInputType.text,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                                decoration: InputDecoration(
                                                  counter: Offstage(),
                                                  hintText: 'Patient Notes',
                                                  labelText: 'Patient Notes',
                                                  prefixIcon: const Icon(
                                                    Icons
                                                        .drive_file_rename_outline,
                                                    color: Colors.grey,
                                                  ),
                                                  contentPadding:
                                                      new EdgeInsets.symmetric(
                                                          vertical: 20.0,
                                                          horizontal: 20.0),
                                                ),
                                                validator: (value) =>
                                                    validateRequiredField(
                                                        value!),
                                              ),
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    value: isChecked,
                                                    /*onChanged: (value) {
                                                      setState(() {
                                                        isChecked =
                                                            value ?? false;
                                                      });
                                                    },*/
                                                    onChanged: null,
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Text('Patient Follow up'),
                                                ],
                                              ),
                                              Visibility(
                                                visible: caseDetialsResponseVO.caseDetails !=null && caseDetialsResponseVO.caseDetails![0].followupdatetime!
                                                .isNotEmpty,
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 10),
                                                    CustomDateTimePickerFormField(
                                                        dateAndTimeController,false),
                                                    SizedBox(height: 20),
                                                    TextFormField(
                                                      maxLines: 1,
                                                      readOnly: true,
                                                      enabled: false,
                                                      controller:
                                                          reasonController,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      decoration:
                                                          InputDecoration(
                                                        counter: Offstage(),
                                                        hintText: 'Reason',
                                                        labelText: 'Reason',
                                                        prefixIcon: const Icon(
                                                          Icons
                                                              .drive_file_rename_outline,
                                                          color: Colors.grey,
                                                        ),
                                                        contentPadding:
                                                            new EdgeInsets
                                                                    .symmetric(
                                                                vertical: 20.0,
                                                                horizontal:
                                                                    20.0),
                                                      ),
                                                      validator: (value) =>
                                                          validateRequiredField(
                                                              value!),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ):SizedBox.shrink(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
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

  void _setImage(PickedFile? pickedFile) {
    if (pickedFile != null) {
      setState(() {
        imageUrl = null;
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

  void getCaseDetails(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    Case cases = Case(caseID: widget.argument);
    CaseDetailsRequestVO detailsRequestVO = CaseDetailsRequestVO(cases: cases);
    print("getCaseDetails ___" + detailsRequestVO.toJson().toString());
    Future<CaseDetialsResponseVO?> apiResponse =
        API.caseDetails(detailsRequestVO);
    apiResponse.catchError(
      (onError) {
        print(onError.toString());
        showToastShortTime(context, onError.toString());
      },
    ).then((value) {
      if (value != null) {
        if (value.success == "1") {
          setState(() {
            caseDetialsResponseVO = value;
            if (value.data != null && value.data!.length > 0) {
              patientName = value.data![0].patientname!;
            }
            if (value.caseDetails != null && value.caseDetails!.length > 0) {
              imageUrl = value.caseDetails![0].soapPic;
              symptomsController.text=value.caseDetails![0].symptoms ?? "";
              prescriptionController.text=value.caseDetails![0].prescription ?? "";
              notesController.text=value.caseDetails![0].notesDesc ?? "";
              if(value.caseDetails![0].followupdatetime!.isNotEmpty){
                isChecked=true;
              }else{
                isChecked=false;

              }
              dateAndTimeController.text=value.caseDetails![0].followupdatetime ?? "";
              reasonController.text="";


            }
          });
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
}

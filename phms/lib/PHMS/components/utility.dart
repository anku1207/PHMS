import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';
import 'package:intl/intl.dart';
import 'package:image/image.dart' as img; // Import the 'image' package



String timestamp() => new DateTime.now().millisecondsSinceEpoch.toString();

void showToastShortTime(BuildContext context, String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM, // also possible "TOP" and "CENTER"
      backgroundColor: Colors.black,
      textColor: Colors.white);
}

void showToastLongTime(BuildContext context, String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM, // also possible "TOP" and "CENTER"
      backgroundColor: Colors.black,
      textColor: Colors.white);
}


void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text(message), duration: Duration(milliseconds: 1000), ), );
}



DateTime StringToDate(String format , String StringDate){
  return new DateFormat(format).parse(StringDate);
}
Future<DateTime?> showDateDialog(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1960),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate) return picked;
}

Map<String, dynamic> AlertDialogDesignResponseWise(String title , String message , String btnText ,bool responseStatus) {
  var dialogDesign = <String, dynamic>{};

  if(responseStatus){
    dialogDesign["H_BACKGROUND_COLOR"]=UavPrimaryColor;
    dialogDesign["H_ICON"]=Icons.check_circle_rounded;
    dialogDesign["BTN_TEXT"]=btnText;
    dialogDesign["BTN_COLOR"]=Color(0xFFB3E5FC);
    dialogDesign["BTN_BORDER_COLOR"]=UavPrimaryColor;
    dialogDesign["MESSAGE"]=message;
    dialogDesign["TITLE"]=title;
  }else{
    dialogDesign["H_BACKGROUND_COLOR"]=actions_bg_orange;
    dialogDesign["H_ICON"]=Icons.sms_failed_outlined;
    dialogDesign["BTN_TEXT"]=btnText;
    dialogDesign["BTN_COLOR"]=Color(0xFFFFCDD2);
    dialogDesign["BTN_BORDER_COLOR"]=Color(0xFFEF5350);;
    dialogDesign["MESSAGE"]=message;
    dialogDesign["TITLE"]=title;
  }

  return dialogDesign;
}

showResponseDialogCbsl(BuildContext context,
    Map<String, dynamic> designMap, Function customCallBack ,{
  bool? backBtn,
}) {
  showDialog(
      context: context,
      barrierDismissible: backBtn ?? true,
      useSafeArea: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              // Returning false will prevent the dialog from being dismissed
              return  backBtn ?? true;
            },
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          padding: const EdgeInsets.all(3.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: designMap["H_BACKGROUND_COLOR"],
                              //border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Icon(
                            designMap["H_ICON"],
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              designMap["TITLE"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              designMap["MESSAGE"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: UavSecondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () => customCallBack("click"),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(designMap["BTN_TEXT"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      )),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      designMap["BTN_COLOR"]),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color:
                                            designMap["BTN_BORDER_COLOR"],
                                            width: 1)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      });
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[0.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

int generateRandom4DigitNumber() {
  Random random = Random();
  return random.nextInt(9000) + 1000; // Generates a random number between 1000 and 9999
}

void showImagePickerDialog(BuildContext context, Function selectItem) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Take a photo'),
              onTap: () {
                selectItem("camera");
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Choose from gallery'),
              onTap: () {
                selectItem("gallery");
              },
            ),
          ],
        ),
      );
    },
  );
}

String convertImageToBase64(PickedFile pickedImage) {
  File imageFile = File(pickedImage.path);

  // Read the image file as bytes
  List<int> imageBytes = imageFile.readAsBytesSync();

  // Convert the bytes to base64
  String base64Image = base64Encode(imageBytes);

  return base64Image;
}

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  try {
    await launch(uri.toString());
  } catch (e) {
    print('Error launching URL: $e');
    // Handle error appropriately
  }
}

bool isNullOrEmpty(String? value) {
  return value == null || value.isEmpty;
}
String convertTo24HourFormat(String time) {
  // Define the input and output formats
  DateFormat inputFormat = DateFormat("hh:mm a");
  DateFormat outputFormat = DateFormat("HH:mm");

  // Parse the input time
  DateTime parsedTime = inputFormat.parse(time);

  // Format the time in 24-hour format
  String formattedTime = outputFormat.format(parsedTime);

  return formattedTime;
}

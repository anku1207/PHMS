import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constants.dart';
import 'package:intl/intl.dart';


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
      firstDate:
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
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
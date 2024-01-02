import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phms/PHMS/components/utility.dart';

import 'constants.dart';

ThemeData theme() {
  final baseTheme =
      ThemeData(primarySwatch: createMaterialColor(Color(0xFF425A8B)));

  return baseTheme.copyWith(
      scaffoldBackgroundColor: Colors.white,
      cardTheme: customCardTheme,
      appBarTheme: appBarTheme(),
      elevatedButtonTheme: customElevatedButtonTheme,
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: customTextSelectionTheme,
      primaryColor: UavPrimaryColor,
      primaryColorDark: UavPrimaryColor,
      primaryColorLight: UavPrimaryColor,
      accentColor: UavPrimaryColor,
      bottomAppBarColor: UavPrimaryColor,
      buttonColor: UavPrimaryColor);
}

const customTextSelectionTheme = TextSelectionThemeData(
  cursorColor: Activity_Cursor_Color,
);

var customElevatedButtonTheme = ElevatedButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: Activity_Button_BG_Color,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        side: BorderSide(color: Activity_Button_Border_Color, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)));

const customCardTheme =
    CardTheme(color: Colors.transparent, shadowColor: Colors.transparent);

AppBarTheme appBarTheme() {
  return AppBarTheme(
    //color: UavPrimaryColor, // Colors.white,
    // elevation: 0,
    //brightness: Brightness.dark,
    backgroundColor: AppBar_Color,
    iconTheme: IconThemeData(color: AppBar_Icon_Color),
    textTheme: TextTheme(
      headline6: TextStyle(color: AppBar_Text_Color, fontSize: 18),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: UavSecondaryColor),
    gapPadding: 5,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    //floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: TextStyle(color: Activity_EditText_Hint_Color),
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    border: outlineInputBorder,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Activity_EditText_Border_Color, width: 1.0),
      gapPadding: 5,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Activity_EditText_Border_Color, width: 1.0),
      gapPadding: 5,
    ),
  );
}

TextTheme textTheme() {
  var baseTheme = TextTheme();
  return baseTheme.copyWith(
    bodyText1: TextStyle(color: Activity_ALL_Text_Color,fontSize: 12.0),
    bodyText2: TextStyle(color: Activity_ALL_Text_Color),
    button: TextStyle(color: Activity_ALL_Text_Color),
    caption: TextStyle(color: Activity_ALL_Text_Color),
    subtitle1: TextStyle(color: Activity_ALL_Text_Color),
    // <-- that's the one
    headline1: TextStyle(color: Activity_ALL_Text_Color,fontSize: 16.0),
    headline2: TextStyle(color: Activity_ALL_Text_Color),
    headline3: TextStyle(color: Activity_ALL_Text_Color),
    headline4: TextStyle(color: Activity_ALL_Text_Color),
    headline5: TextStyle(color: Activity_ALL_Text_Color),
    headline6: TextStyle(color: Activity_ALL_Text_Color),
  );
}

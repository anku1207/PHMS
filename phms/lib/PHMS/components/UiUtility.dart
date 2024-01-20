import 'package:flutter/material.dart';

Future<String>? showAlertDialog(
    {required BuildContext context,
    String? title,
    required String message,
    required String btnNameOk,
    String? btnNameCancel}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title == null ? "" : title),
      content: Text(message),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the radius as needed
      ),
      actions: <Widget>[
        if (btnNameCancel != null)
          TextButton(
            onPressed: () => Navigator.pop(context, btnNameCancel),
            child: Text(btnNameCancel),
          ),
        TextButton(
          onPressed: () => Navigator.pop(context, btnNameOk),
          child: Text(btnNameOk),
        ),
      ],
    ),
  );
}



Future<String?> showAlertDialogConfirmation({
  required BuildContext context,
  String? title,
  required String message,
  required String btnNameOk,
  String? btnNameCancel,
  bool? backBtn,
  Function(String)? onOkPressed,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: backBtn ?? false,
    builder: (BuildContext context) => WillPopScope(
      onWillPop: () async {
        // Returning false will prevent the dialog from being dismissed
        return backBtn ?? false;
      },
      child: AlertDialog(
        title: Text(title == null ? "" : title),
        content: Text(message),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        actions: <Widget>[
          if (btnNameCancel != null)
            TextButton(
              onPressed: () => Navigator.pop(context, btnNameCancel),
              child: Text(btnNameCancel),
            ),
          TextButton(
            onPressed: () {
              if (onOkPressed != null) {
                onOkPressed("ok");
              } else {
                Navigator.pop(context, btnNameOk);
              }
            },
            child: Text(btnNameOk),
          ),
        ],
      ),
    ),
  );
}

Container dropDownLayout(BuildContext context, String hintText,
    List<String> dropdownList, Function customCallBack) {
  List<DropdownMenuItem<String>> dropdownItems = dropdownList
      .map((String item) =>
          DropdownMenuItem<String>(value: item, child: Text(item)))
      .toList();

  return Container(
    height: 50.0,
    child: InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust horizontal padding
        prefixIcon: Icon(Icons.drive_file_rename_outline),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
            hintText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          isExpanded: true,
          iconSize: 30.0,
          style: Theme.of(context).textTheme.bodyText1,
          items: dropdownItems,
          onChanged: (val) => customCallBack(val),
        ),
      ),
    ),
  );
}

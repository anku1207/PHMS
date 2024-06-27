import 'package:flutter/material.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/view/home/appointment/patient/CancelAppointmentBottomSheet.dart';

import 'constants.dart';

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
            style: Theme.of(context).textTheme.bodyText2,
          ),
          isExpanded: true,
          iconSize: 30.0,
          style: Theme.of(context).textTheme.bodyText2,
          items: dropdownItems,
          onChanged: (val) => customCallBack(val),
        ),
      ),
    ),
  );
}
void cancelAppointment(BuildContext context, Function returnFunction) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Cancel Appointment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(
                  "Are you sure you want to cancel this appointment ?",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      returnFunction("no");
                    },
                    child: Text("No",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      returnFunction("yes");
                    },
                    child: Text("Yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                  )
                ],
              ),
            ),
          ],
        );
      });
}


void appointmentConfirmation(BuildContext context,String title,String message ,Function returnFunction,{yes,no}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "$title",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(
                  "$message",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      returnFunction("no");
                    },
                    child: Text("$no",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      returnFunction("yes");
                    },
                    child: Text("$yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                  )
                ],
              ),
            ),
          ],
        );
      });
}



Align caseHistoryReports(BuildContext context, Function function ){
 return Align(
    alignment: Alignment.bottomRight,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            function("report");
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.0,
                // Width is set correctly
                padding: const EdgeInsets.all(4.0),
                constraints: BoxConstraints(
                  minHeight:
                  50.0, // Set the minimum height
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Activity_Box_Border_Color,
                    // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Border radius for rounded corners
                ),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      child: Image.asset(
                        "assets/images/report.png",
                        color: UavPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Report",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(
                        fontSize:
                        8.0, // Set your desired font size here
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20), // Add horizontal space
        GestureDetector(
          onTap: () {
            /* Navigator.of(context, rootNavigator: true)
                                      .pushNamed(UavRoutes.PDF_Viewer_Screen,
                                      arguments:
                                      "https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");*/
            function("bill");
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.0,
                // Width is set correctly
                padding: const EdgeInsets.all(4.0),
                constraints: BoxConstraints(
                  minHeight:
                  50.0, // Set the minimum height
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Activity_Box_Border_Color,
                    // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Border radius for rounded corners
                ),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      child: Image.asset(
                        "assets/images/medical_bill.png",
                        color: UavPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Bill",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(
                        fontSize:
                        8.0, // Set your desired font size here
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20), // Add horizontal space
        GestureDetector(
          onTap: () {
            function("prescription");

            /*Navigator.of(context, rootNavigator: true)
                                      .pushNamed(UavRoutes.PDF_Viewer_Screen,
                                          arguments:
                                              "https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");*/
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.0,
                // Width is set correctly
                padding: const EdgeInsets.all(4.0),
                constraints: BoxConstraints(
                  minHeight:
                  50.0, // Set the minimum height
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Activity_Box_Border_Color,
                    // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Border radius for rounded corners
                ),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      child: Image.asset(
                        "assets/images/Prescription.png",
                        color: UavPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Prescription",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(
                        fontSize:
                        8.0, // Set your desired font size here
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Align showCancelAndReschedule(BuildContext context){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            cancelAppointment(context, (result) {
              Navigator.pop(context);
              if (result?.toLowerCase() == "yes") {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return CancelAppointmentBottomSheet(argument: null);
                  },
                );
              }
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.0,
                // Width is set correctly
                padding: const EdgeInsets.all(4.0),
                constraints: BoxConstraints(
                  minHeight: 50.0, // Set the minimum height
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Activity_Box_Border_Color,
                    // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Border radius for rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      child: Icon(
                        Icons.cancel,
                        // Use the appropriate icon here
                        color: Colors.red,
                        size:
                        20.0, // Set the desired size for the icon
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Cancel",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(
                        fontSize:
                        8.0, // Set your desired font size here
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20), // Add horizontal space
        GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pushNamed(
                UavRoutes.Book_Appointment,
                arguments: {"booking_type": "re"});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.0,
                // Width is set correctly
                padding: const EdgeInsets.all(4.0),
                constraints: BoxConstraints(
                  minHeight: 50.0, // Set the minimum height
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Activity_Box_Border_Color,
                    // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Border radius for rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      child: Icon(
                        Icons.access_time_filled,
                        // Use the appropriate icon here
                        color: UavPrimaryColor,
                        size:
                        20.0, // Set the desired size for the icon
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Reschedule",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(
                        fontSize:
                        8.0, // Set your desired font size here
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Row appointmentBookBtn(BuildContext context){
  return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pushNamed(
                UavRoutes.Book_Appointment,
                arguments: {"booking_type":"v"});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.0, // Width is set correctly
                padding: const EdgeInsets.all(4.0),
                constraints: BoxConstraints(
                  minHeight: 50.0, // Set the minimum height
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Activity_Box_Border_Color, // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Border radius for rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      child: Image.asset(
                        "assets/images/Calladoctor.png",
                        color: UavPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Call A Doctor",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 8.0, // Set your desired font size here
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20), // Add horizontal space
        GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pushNamed(
                UavRoutes.Book_Appointment,
                arguments:{"booking_type":"c"});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.0, // Width is set correctly
                padding: const EdgeInsets.all(4.0),
                constraints: BoxConstraints(
                  minHeight: 50.0, // Set the minimum height
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Activity_Box_Border_Color, // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Border radius for rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      child: Image.asset(
                        "assets/images/visitclinic.png",
                        color: UavPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Visit Clinic",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 8.0, // Set your desired font size here
                      ),                                              textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
  );
}

Widget buildLoadingOrDataWidget(BuildContext context, bool isLoading) {
  return isLoading
      ? Center(
    child: Container(
      color: Colors.black.withOpacity(0.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  )
      : Center(
    child: Text(
      'Data not found',
      style: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(fontSize: 16),
    ),
  );
}




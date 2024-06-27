import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/DashboardItemVO.dart';

import 'package:phms/PHMS/model/response_model/patient/PatientAppointmentListResVO.dart'
    as response;
import 'package:phms/PHMS/model/request_model/patient/PatientAppointmentReqVO.dart';
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart' as Login;
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;

import 'CancelAppointmentBottomSheet.dart';

class AppointmentTab extends StatefulWidget {
  late final Object argument;

  AppointmentTab({required this.argument});

  @override
  State<AppointmentTab> createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    _tabController.addListener(() {
      // You can add any listener code here if needed
      print('Tab Index: ${_tabController.index}');
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        child: Container(
            child: SafeArea(
          child: Scaffold(
            appBar: new AppBar(
              title: new Text("Appointment"),
              actions: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/visitclinic.png',
                    width: 20.0, // Set the desired width
                    height: 20.0,
                    color: Colors.white, // Set the desired height
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: false).pushNamed(
                        UavRoutes.Doctor_List,
                        arguments: {"data": null});
                  },
                ),
              ],
              bottom: new TabBar(
                isScrollable: false,
                labelColor: Activity_Tab_Select_Color,
                indicatorColor: Activity_Tab_Select_Color,
                unselectedLabelColor: Activity_Tab_UnSelect_Color,
                controller: _tabController,
                tabs: [
                  Tab(text: 'Upcoming'),
                ],
              ),
            ),
            body: new TabBarView(
              controller: _tabController,
              // children:classobjcet,
              children: [
                HomeTab(selectTab: 1),
              ],
            ),
          ),
        )));
  }
}

class HomeTab extends StatefulWidget {
  late final int selectTab;

  HomeTab({required this.selectTab});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late List<response.Invoices> appointmentList = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      getAppointmentList(context);
    });
  }

  getAppointmentList(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    checkCustomerSession().then((value) {
      if (value != null) {
        print('Value before decoding: $value');
        Map<String, dynamic> data1 = jsonDecode(value);
        Login.Data data = Login.Data.fromJson(data1);

        Case cases = Case(
            patientID: data.userid,
            fromDate: "",
            toDate: "",
            doctorID: "",
            followup: "Y");

        PatientAppointmentReqVO patientAppointmentReqVO =
            new PatientAppointmentReqVO(cases: cases);

        print("appointmentListRequestVO ___" +
            patientAppointmentReqVO.toJson().toString());
        Future<response.PatientAppointmentListResVO?> patientAppointmentResVO =
            API.getPatientAppointmentList(patientAppointmentReqVO);
        patientAppointmentResVO.catchError(
          (onError) {
            print(onError.toString());
            showToastShortTime(context, onError.toString());
          },
        ).then((value) {
          if (value != null) {
            if (value.success == "1") {
              setState(() {
                appointmentList.addAll(value.invoices!);
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
          setState(() {
            isLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return appointmentList.isNotEmpty
        ? Stack(children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                    UavRoutes.Patient_Case_Details_Screen,
                    arguments: {
                      "patientName": 'John Doe',
                      "caseDescription":
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel arcu sed metus commodo pretium.',
                      "diagnosis": 'Diagnosis details...',
                      "treatment":
                          'Prescribed antibiotics for 10 days. Advised to rest and drink fluids.',
                      "showReports": false
                    });
              },
              child: Container(
                child: ListView.separated(
                  itemCount: appointmentList.length + 1,
                  // Add 1 to account for the space
                  separatorBuilder: (context, index) => SizedBox(height: 0),
                  // Add space between items
                  itemBuilder: (context, index) {
                    if (index < appointmentList.length) {
                      final appointment = appointmentList[index];
                      return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.grey[400]!,
                              width: 1.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Card(
                            margin: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Doctor: ${appointment.address}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                      'Date: ${appointment.appointmentdatetime}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  SizedBox(height: 4),
                                  Text('Time: ${appointment.appointmentID}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  SizedBox(height: 4),
                                  Text('Location: ${appointment.reason}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  SizedBox(height: 20),
                                  if (widget.selectTab == 1)
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              cancelAppointment(context,
                                                  (result) {
                                                Navigator.pop(context);
                                                if (result?.toLowerCase() ==
                                                    "yes") {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    builder:
                                                        (BuildContext context) {
                                                      return CancelAppointmentBottomSheet(
                                                          argument: null);
                                                    },
                                                  );
                                                }
                                              });
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  // Width is set correctly
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  constraints: BoxConstraints(
                                                    minHeight:
                                                        50.0, // Set the minimum height
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          Activity_Box_Border_Color,
                                                      // Border color
                                                      width:
                                                          1.0, // Border width
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0), // Border radius for rounded corners
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  20), // Add horizontal space
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pushNamed(
                                                      UavRoutes
                                                          .Book_Appointment,
                                                      arguments: {
                                                    "booking_type": "re"
                                                  });
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  // Width is set correctly
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  constraints: BoxConstraints(
                                                    minHeight:
                                                        50.0, // Set the minimum height
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          Activity_Box_Border_Color,
                                                      // Border color
                                                      width:
                                                          1.0, // Border width
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0), // Border radius for rounded corners
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 20.0,
                                                        width: 20.0,
                                                        child: Icon(
                                                          Icons
                                                              .access_time_filled,
                                                          // Use the appropriate icon here
                                                          color:
                                                              UavPrimaryColor,
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
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ));
                    } else {
                      // Return an empty SizedBox after the last item
                      return SizedBox(height: 80);
                    }
                  },
                ),
              ),
            )
          ])
        : buildLoadingOrDataWidget(context,isLoading);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/DashboardItemVO.dart';
import 'package:phms/PHMS/model/response_model/AppointmentListResponseVO.dart';
import 'package:url_launcher/url_launcher.dart';

class CaseHistoryTab extends StatefulWidget {
  late final Object argument;

  CaseHistoryTab({required this.argument});

  @override
  State<CaseHistoryTab> createState() => _CaseHistoryTabState();
}

class _CaseHistoryTabState extends State<CaseHistoryTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
              title: new Text("Case History"),
              bottom: new TabBar(
                isScrollable: false,
                labelColor: Activity_Tab_Select_Color,
                indicatorColor: Activity_Tab_Select_Color,
                unselectedLabelColor: Activity_Tab_UnSelect_Color,
                controller: _tabController,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'Self'),
                  Tab(icon: Icon(Icons.person), text: 'Family'),
                ],
              ),
            ),
            body: new TabBarView(
              controller: _tabController,
              // children:classobjcet,
              children: [
                HomeTab(selectTab: 1),
                HomeTab(selectTab: 2),
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
  final List<Invoices> appointmentList = [
    Invoices(
      address: "Dr. John Doe",
      appointmentdatetime: "2024-06-01",
      appointmentID: "1",
      reason: "Tantia Hospital, Pune",
    ),
    Invoices(
      address: "Dr. John Doe",
      appointmentdatetime: "2024-06-01",
      appointmentID: "1",
      reason: "Tantia Hospital, Pune",
    ),
    Invoices(
      address: "Dr. John Doe",
      appointmentdatetime: "2024-06-01",
      appointmentID: "1",
      reason: "Tantia Hospital, Pune",
    ),
    Invoices(
      address: "Dr. John Doe",
      appointmentdatetime: "2024-06-01",
      appointmentID: "1",
      reason: "Tantia Hospital, Pune",
    ),
    Invoices(
      address: "Dr. John Doe",
      appointmentdatetime: "2024-06-01",
      appointmentID: "1",
      reason: "Tantia Hospital, Pune",
    ),
    Invoices(
      address: "Dr. John Doe",
      appointmentdatetime: "2024-06-01",
      appointmentID: "1",
      reason: "Tantia Hospital, Pune",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(UavRoutes.Patient_Case_Details_Screen, arguments: {
            "patientName": 'John Doe',
            "caseDescription":
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel arcu sed metus commodo pretium.',
            "diagnosis": 'Diagnosis details...',
            "treatment":
                'Prescribed antibiotics for 10 days. Advised to rest and drink fluids.',
            "showReports":true
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: .0,
                      margin: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date: ${appointment.appointmentdatetime}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(fontSize: 16)),
                            SizedBox(height: 4),
                            Text(
                              'Doctor: ${appointment.address}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text('Hospital Name: ${appointment.reason}',
                                style: Theme.of(context).textTheme.bodyText2),
                            SizedBox(height: 4),
                            Text('Address: ${appointment.reason}',
                                style: Theme.of(context).textTheme.bodyText2),
                            SizedBox(height: 16),
                            caseHistoryReports(context, (result) {
                              if (result == "report") {
                                launchURL(
                                    "https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");
                              } else if (result == "bill") {
                                launchURL(
                                    "https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");
                              } else if (result == "prescription") {
                                launchURL(
                                    "https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");
                              }
                            })
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
    ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
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
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Activity_Box_Border_Color,
                      // Adjust border color as needed
                      width: 1.0, // Adjust border width as needed
                    ),
                  ),
                  elevation: 4.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {},
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
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(UavRoutes.PDF_Viewer_Screen,
                                      arguments:
                                      "https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");
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

                                  _launchURL("https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf");
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
                        ),
                      ],
                    ),
                  ),
                );
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      await launch(uri.toString());
    } catch (e) {
      print('Error launching URL: $e');
      // Handle error appropriately
    }
  }
}

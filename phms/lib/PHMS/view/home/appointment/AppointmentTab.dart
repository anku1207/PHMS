import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/model/DashboardItemVO.dart';
import 'package:phms/PHMS/model/response_model/AppointmentListResponseVO.dart';

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
              title: new Text("Appointment"),
              bottom: new TabBar(
                isScrollable: false,
                labelColor: Activity_Tab_Select_Color,
                indicatorColor: Activity_Tab_Select_Color,
                unselectedLabelColor: Activity_Tab_UnSelect_Color,
                controller: _tabController,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'Case History'),
                  Tab(icon: Icon(Icons.person), text: 'Upcoming Appointment'),
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
     Container(
          child: ListView.separated(
            itemCount: appointmentList.length + 1, // Add 1 to account for the space
            separatorBuilder: (context, index) => SizedBox(height: 0), // Add space between items
            itemBuilder: (context, index) {
              if (index < appointmentList.length) {
                final appointment = appointmentList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Activity_Box_Border_Color, // Adjust border color as needed
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
                        Text(
                          'Doctor: ${appointment.address}',
                          style:Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 8),
                        Text('Date: ${appointment.appointmentdatetime}',style:Theme.of(context).textTheme.bodyText2),
                        SizedBox(height: 4),
                        Text('Time: ${appointment.appointmentID}',style:Theme.of(context).textTheme.bodyText2),
                        SizedBox(height: 4),
                        Text('Location: ${appointment.reason}',style:Theme.of(context).textTheme.bodyText2),
                        SizedBox(height: 16),
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
      Positioned(
        bottom: 0,
        left: 15,
        right: 15,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: false).pushNamed(
                UavRoutes.Doctor_List,
                arguments: {"data": null});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.0, // Width is set correctly
                padding: const EdgeInsets.all(4.0),
                constraints: BoxConstraints(
                  minHeight: 70.0, // Set the minimum height
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
                      height: 30.0,
                      width: 30.0,
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
      )
    ]);
  }
}

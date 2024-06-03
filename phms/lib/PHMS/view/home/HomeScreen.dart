import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/constants.dart' as Constants;
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/model/DashboardItemVO.dart';
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart' as Login;


import 'package:phms/PHMS/model/DashboardItemVO.dart';

import 'Drawer_Widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DashboardItemVO> myList =
      List.filled(0, DashboardItemVO(), growable: true);
  String title = "";
  String loginType = "";
  String username="";
  String email="";

  int _currentIndex = 0;

  final List<String> sideImages = [
    "assets/images/banner_1.png",
    "assets/images/banner_2.png",
    "assets/images/banner_3.png",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    (() async {
      await fetchData();
    })();
  }

  Future<void> fetchData() async {
    List<Future<String?>> futures = [
      checkCustomerSession(),
      getUserTypeLogin(),
    ];

    List<String?> results = await Future.wait(futures);

    String? customerSession = results[0];
    String? userTypeLogin = results[1];
    setState(() {
      loginType = userTypeLogin!;
    });
    if (userTypeLogin.toString() == "1") {
      setState(() {
        title = "Doctor Dashboard";
      });
      myList.add(DashboardItemVO(
          id: Patient_Registration,
          name: "Patient Registration",
          image: "assets/images/registration.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: View_Appointment,
          name: "View Appointment",
          image: "assets/images/appointment.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: Patient_History,
          name: "Patient History",
          image: "assets/images/viewhistory.png",
          count: "0"));

      myList.add(DashboardItemVO(
          id: Refer_A_Doctor,
          name: "Refer another doctor/Hospital",
          image: "assets/images/viewcase.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: View_Appointment_MR,
          name: "View Appointment for MRs",
          image: "assets/images/viewcase.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: View_Product_MR,
          name: "View Products uploaded by MR",
          image: "assets/images/viewcase.png",
          count: "0"));
    } else {
      setState(() {
        title = "Patient Dashboard";
      });

      myList.add(DashboardItemVO(
          id: Search_Doctors_By_Specialization_Location,
          name: "Search Doctors",
          image: "assets/images/viewcase.png",
          count: "0"));


      myList.add(DashboardItemVO(
          id: Appointment,
          name: "Appointment",
          image: "assets/images/viewhistory.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: Medicine_next_Visit_Scheduler,
          name: "Scheduler",
          image: "assets/images/scheduler.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: Case_History,
          name: "Case History",
          image: "assets/images/viewcase.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: Hospitalization,
          name: "Hospitalization",
          image: "assets/images/uploadreports.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: Refer_Doctor,
          name: "Refer Doctor",
          image: "assets/images/viewcase.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: Refer_APP,
          name: "Refer App",
          image: "assets/images/viewcase.png",
          count: "0"));

    }

    Map<String, dynamic> data1 = jsonDecode(customerSession!);
    Login.Data data = Login.Data.fromJson(data1);

    setState(() {
      username=data.customerName!;
    });
    // Do something with the results...
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - (kToolbarHeight - 300)) / 8;
    final double itemWidth = size.width / 2;
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
              "Dashboard",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          drawer: DrawerWidget(
            userName: "$username",
            email: "test@gmail.com",
            loginType: loginType,
            previousContext: context,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: Stack(
                                overflow: Overflow.visible,
                                alignment: Alignment.bottomCenter,
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      height: 250.0,
                                      autoPlay: false,
                                      enlargeCenterPage: true,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 1,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                    items: sideImages.map((item) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Set border radius
                                            child: Container(
                                              width: double.infinity,
                                              child: Image.asset(item,
                                                  fit: BoxFit.cover),
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                  DotsIndicator(
                                    dotsCount: sideImages.length,
                                    position: _currentIndex.toDouble(),
                                    decorator: DotsDecorator(
                                      color: Colors.grey,
                                      // Inactive dot color
                                      activeColor: Constants.UavPrimaryColor,
                                      // Active dot color
                                      spacing: EdgeInsets.all(5.0),
                                      // Spacing between dots
                                      size: Size(10.0, 10.0),
                                      // Size of each dot
                                      activeSize: Size(
                                          12.0, 12.0), // Size of the active dot
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.3,
                              ),
                              padding: EdgeInsets.all(5.0),
                              controller: ScrollController(keepScrollOffset: false),
                              itemCount: myList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // Add your onTap logic for the entire Column here
                                    openViewMenuWise(context, myList[index].id!);
                                  },
                                  child:Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        // implement shadow effect
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black54, // shadow color
                                            blurRadius: 5, // shadow radius
                                            offset: Offset(5, 5), // shadow offset
                                            spreadRadius: 0.1, // The amount the box should be inflated prior to applying the blur
                                          ),
                                        ],
                                      ),
                                      margin: const EdgeInsets.all(10.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 40.0,
                                              width: 40.0,
                                              child: Image.asset(
                                                myList[index].image!,
                                                color: UavPrimaryColor,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              myList[index].name!,
                                              style: Theme.of(context).textTheme.bodyText2,
                                              textAlign: TextAlign.center, // Align text horizontally
                                              maxLines: 2, // Maximum lines
                                              overflow: TextOverflow.ellipsis, // Show ellipsis (...) if text exceeds 2 lines
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                );
                              },
                            ),

                          ],
                        ) //
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
  double _calculateContainerHeight(String? text) {
    // Assuming the maxHeight is 200, adjust as needed
    const double maxHeight = 150;
    const double padding = 16 * 2 + 200; // Padding on top and bottom
    const double imageHeight = 50;
    const double textSpacing = 10;
    double textHeight = text != null ? (text.length / 15) * 20 : 0; // Assuming 15 characters per line and 20px height per line

    // Calculate total height needed considering padding, image height, text height, and spacing
    double totalHeight = padding + imageHeight + textSpacing + textHeight;

    // Return the minimum of the calculated total height and the maximum height
    return totalHeight > maxHeight ? maxHeight : totalHeight;
  }

  void openViewMenuWise(BuildContext context, int serviceId) {
    if (serviceId == 2) {
      Navigator.of(context, rootNavigator: true)
          .pushNamed(UavRoutes.Patient_registration_Screen);
    } else if (serviceId == 15) {

      Navigator.of(context, rootNavigator: true).pushNamed(
          UavRoutes.Doctor_List,
          arguments: {"data": null});
    } else if (serviceId == 16) {
      Navigator.of(context, rootNavigator: true).pushNamed(
          UavRoutes.Case_History_Tab,
          arguments: {"data": null});
    } else if (serviceId == 9) {
     /* Navigator.of(context, rootNavigator: true)
          .pushNamed(UavRoutes.History_screen_1, arguments: {"data": null});*/
      Navigator.of(context, rootNavigator: true)
          .pushNamed(UavRoutes.Appointment_list_grid, arguments: {"data": null});
    } else if (serviceId == 5) {
      Navigator.of(context, rootNavigator: true)
          .pushNamed(UavRoutes.Appointment_list, arguments: {"data": null});

    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/constants.dart' as Constants;
import 'package:phms/PHMS/model/DashboardItemVO.dart';

import 'package:phms/PHMS/model/DashboardItemVO.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DashboardItemVO> myList =
      List.filled(0, DashboardItemVO(), growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myList.add(DashboardItemVO(
        id: Profile,
        name: "Profile",
        image: "assets/images/login.png",
        count: "0"));
    myList.add(DashboardItemVO(
        id: Patient_Registration,
        name: "Patient Registration",
        image: "assets/images/registration.png",
        count: "0"));
    myList.add(DashboardItemVO(
        id: New_Case,
        name: "New Case",
        image: "assets/images/medicalcase.png",
        count: "0"));
    myList.add(DashboardItemVO(
        id: Patient_History,
        name: "Patient History",
        image: "assets/images/viewhistory.png",
        count: "0"));
    myList.add(DashboardItemVO(
        id: View_Appointment,
        name: "View Appointment",
        image: "assets/images/appointment.png",
        count: "0"));
    myList.add(DashboardItemVO(
        id: Document_Images,
        name: "Document / Images",
        image: "assets/images/viewcase.png",
        count: "0"));
    myList.add(DashboardItemVO(
        id: Refer_A_Doctor,
        name: "Refer A Doctor",
        image: "assets/images/viewcase.png",
        count: "0"));
    myList.add(DashboardItemVO(
        id: Advanced_Search,
        name: "Advanced Search",
        image: "assets/images/viewcase.png",
        count: "0"));
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
            title: Text("Dashboard"),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Container(
            color: Constants.UavPrimaryColor,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Card(
                        // margin: EdgeInsets.zero,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Doctor Dashboard",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GridView.count(
                                childAspectRatio: itemWidth / itemHeight,
                                // Adjust this ratio for desired item height
                                crossAxisCount: 2,
                                // Set this to 2 to display 2 columns
                                padding: EdgeInsets.all(5.0),
                                shrinkWrap: true,
                                controller: new ScrollController(
                                    keepScrollOffset: false),
                                children: List.generate(myList.length, (index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 100.0,
                                        // You can adjust this height if needed
                                        width: 100.0,
                                        // You can adjust this width if needed
                                        child:
                                            Image.asset(myList[index].image!),
                                      ),
                                      Text(
                                        myList[index].name!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  );
                                }),
                              ),
                            )
                          ],
                        ) //
                        ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

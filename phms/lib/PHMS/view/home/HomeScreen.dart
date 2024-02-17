import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/constants.dart' as Constants;
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/model/DashboardItemVO.dart';

import 'package:phms/PHMS/model/DashboardItemVO.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DashboardItemVO> myList =
      List.filled(0, DashboardItemVO(), growable: true);
  late String title;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserTypeLogin().then((value){
      if(value.toString()=="1"){
        setState(() {
          title="Doctor Dashboard";
        });
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
      }else{
        setState(() {
          title="Patient Dashboard";
        });
        myList.add(DashboardItemVO(
            id: Profile,
            name: "Profile",
            image: "assets/images/login.png",
            count: "0"));
        myList.add(DashboardItemVO(
            id: History,
            name: "History",
            image: "assets/images/viewhistory.png",
            count: "0"));
        myList.add(DashboardItemVO(
            id: View_Appointment,
            name: "View Appointment",
            image: "assets/images/appointment.png",
            count: "0"));
        myList.add(DashboardItemVO(
            id: Report,
            name: "Report",
            image: "assets/images/appointment.png",
            count: "0"));
        myList.add(DashboardItemVO(
            id: Document_Images,
            name: "Document / Images",
            image: "assets/images/viewcase.png",
            count: "0"));
        myList.add(DashboardItemVO(
            id: Medical_Bill,
            name: "Medical Bill",
            image: "assets/images/uploadreports.png",
            count: "0"));
        myList.add(DashboardItemVO(
            id: Medical_Scheduler,
            name: "Medical Scheduler",
            image: "assets/images/viewcase.png",
            count: "0"));
        myList.add(DashboardItemVO(
            id: Advanced_Search,
            name: "Advanced Search",
            image: "assets/images/viewcase.png",
            count: "0"));
      }

    });

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
            title: Text("Dashboard" ,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Container(
            color: Constants.UavPrimaryColor,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                    child: Card(
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
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
                                      title,
                                      style: Theme.of(context).textTheme.headline1!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                  return InkWell(
                                    onTap: () {
                                      // Add your onTap logic for the entire Column here
                                      openViewMenuWise(context,myList[index].id!);

                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 100.0,
                                          width: 100.0,
                                          child: Image.asset(myList[index].image!),
                                        ),
                                        Text(
                                          myList[index].name!,
                                          style: Theme.of(context).textTheme.bodyText1,

                                        )
                                      ],
                                    ),
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

  void openViewMenuWise(BuildContext context ,int serviceId ){
    if(serviceId == 3){
      Navigator.of(context, rootNavigator: true).pushNamed(UavRoutes.Patient_case_register_screen_1,arguments: {"data":null});
    }else if(serviceId == 4){
      Navigator.of(context, rootNavigator: true).pushNamed(UavRoutes.Patient_history_screen_1,arguments: {"data":null});
    }else if(serviceId == 9){
      Navigator.of(context, rootNavigator: true).pushNamed(UavRoutes.History_screen_1,arguments: {"data":null});
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/model/DashboardItemVO.dart';

class AppointmentGrid extends StatefulWidget {
  late final Object argument;
  AppointmentGrid({required this.argument});
  @override
  State<AppointmentGrid> createState() => _AppointmentGridState();
}

class _AppointmentGridState extends State<AppointmentGrid> {
  List<DashboardItemVO> myList =
  List.filled(0, DashboardItemVO(), growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    (() async {
      await fetchData();
    })();
  }

  Future<void> fetchData() async {

      myList.add(DashboardItemVO(
          id: Case_History,
          name: "Case History",
          image: "assets/images/viewhistory.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: UpcomingAppointment,
          name: "Upcoming Appointment",
          image: "assets/images/appointment.png",
          count: "0"));
      myList.add(DashboardItemVO(
          id: New_Case,
          name: "New Appointment",
          image: "assets/images/appointment.png",
          count: "0"));
    // Do something with the results...
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
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Appointment",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white),
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

  void openViewMenuWise(BuildContext context, int serviceId) {
    if (serviceId == 3) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext bc) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "Appointment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context, rootNavigator: true).pushNamed(
                                  UavRoutes.Video_case_register_screen_1,
                                  arguments: {"data": null});
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60.0,
                                  width: 60.0,
                                  child: Image.asset(
                                    "assets/images/Calladoctor.png",
                                    color: UavPrimaryColor,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Call A Doctor",
                                  style: Theme.of(context).textTheme.bodyText2,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context, rootNavigator: true).pushNamed(
                                  UavRoutes.Patient_case_register_screen_1,
                                  arguments: {"data": null});
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60.0,
                                  width: 60.0,
                                  child: Image.asset(
                                    "assets/images/visitclinic.png",
                                    color: UavPrimaryColor,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Visit Clinic",
                                  style: Theme.of(context).textTheme.bodyText2,
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
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else if (serviceId == 16) {
      Navigator.of(context, rootNavigator: true)
          .pushNamed(UavRoutes.History_screen_1, arguments: {"data": null});
    }
  }
}

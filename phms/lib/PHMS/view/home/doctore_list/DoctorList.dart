import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/model/response_model/DoctorListResponseVO.dart';

import 'DoctorFilterBottomSheet.dart';

class DoctorList extends StatefulWidget {
  late final Object argument;

  DoctorList({required this.argument});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  late DoctorListResponseVO doctorListResponseVO;
  List<Doctorlist> doctorsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Doctorlist doctorlist = Doctorlist(
        doctorName: "Dr. John Doe",
        hospital: "Tantia Hospital",
        address: "P68, D2-block, Midc., Chinchwad",
        city: "Pune",
        country: "India",
        phoneNumber: "27475929",
        state: "Maharashtra",
        specialty: "Cardiology",
        time: "12.00",
        zipCode: "411019");
    doctorsList.add(doctorlist);
    doctorlist = Doctorlist(
        doctorName: "Dr. John Doe",
        hospital: "Tantia Hospital",
        address: "P68, D2-block, Midc., Chinchwad",
        city: "Pune",
        country: "India",
        phoneNumber: "27475929",
        state: "Maharashtra",
        specialty: "Cardiology",
        time: "12.00",
        zipCode: "411019");
    doctorsList.add(doctorlist);
    doctorlist = Doctorlist(
        doctorName: "Dr. John Doe",
        hospital: "Tantia Hospital",
        address: "P68, D2-block, Midc., Chinchwad",
        city: "Pune",
        country: "India",
        phoneNumber: "27475929",
        state: "Maharashtra",
        specialty: "Cardiology",
        time: "12.00",
        zipCode: "411019");
    doctorsList.add(doctorlist);
    doctorlist = Doctorlist(
        doctorName: "Dr. John Doe",
        hospital: "Tantia Hospital",
        address: "P68, D2-block, Midc., Chinchwad",
        city: "Pune",
        country: "India",
        phoneNumber: "27475929",
        state: "Maharashtra",
        specialty: "Cardiology",
        time: "12.00",
        zipCode: "411019");
    doctorsList.add(doctorlist);

    doctorListResponseVO = DoctorListResponseVO(doctorlist: doctorsList);
  }

  void _filterDoctors(Map<String, String> filters) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return DoctorFilterBottomSheet(
                    onFilterApplied: _filterDoctors,
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: doctorListResponseVO.doctorlist!.length,
              itemBuilder: (context, index) {
                final doctor = doctorListResponseVO.doctorlist![index];
                return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      // Rounded corners
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, UavRoutes.Doctor_Details,
                            arguments: {});
                      },
                      child: Card(
                        margin: const EdgeInsets.all(4.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  doctor.doctorName!,
                                  style:Theme.of(context).textTheme.headline2
                              ),
                              SizedBox(height: 8),
                              Text('Specialty: ${doctor.specialty}',style:Theme.of(context).textTheme.bodyText2),
                              SizedBox(height: 4),
                              Text('Hospital: ${doctor.hospital}',style:Theme.of(context).textTheme.bodyText2),
                              SizedBox(height: 4),
                              Text('Address: ${doctor.address}',style:Theme.of(context).textTheme.bodyText2),
                              SizedBox(height: 4),
                              Text('City: ${doctor.city}',style:Theme.of(context).textTheme.bodyText2),
                              SizedBox(height: 4),
                              Text('State: ${doctor.state}',style:Theme.of(context).textTheme.bodyText2),
                              SizedBox(height: 4),
                              Text('Zip Code: ${doctor.zipCode}',style:Theme.of(context).textTheme.bodyText2),
                              SizedBox(height: 4),
                              Text('Phone Number: ${doctor.phoneNumber}',style:Theme.of(context).textTheme.bodyText2),
                              SizedBox(height: 4),
                              Text('Time: ${doctor.time}',style:Theme.of(context).textTheme.bodyText2),
                              SizedBox(height: 4),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context, rootNavigator: true).pushNamed(
                                            UavRoutes.Video_case_register_screen_1,
                                            arguments: {"data": null});
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
                                        Navigator.of(context, rootNavigator: false).pushNamed(
                                            UavRoutes.Patient_case_register_screen_1,
                                            arguments: {"data": null});
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

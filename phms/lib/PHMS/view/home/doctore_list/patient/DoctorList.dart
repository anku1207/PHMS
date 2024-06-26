import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/patient/DoctorListReqVO.dart';
import 'package:phms/PHMS/model/response_model/DoctorListResponseVO.dart';
import 'package:phms/PHMS/model/response_model/patient/DoctorListResVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart' as Login;


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

    Future.delayed(Duration.zero, () {
      _getDoctorList(context);
    });
  }

  _getDoctorList(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());

    checkCustomerSession().then((value) {
      if (value != null) {
        print('Value before decoding: $value');
        Map<String, dynamic> data1 = jsonDecode(value);
        Login.Data data = Login.Data.fromJson(data1);

        Place place = new Place(doctorname: "",location: "",specialisation: "");


        DoctorListReqVO  doctorListReqVO=
        new DoctorListReqVO(place: place);

        print("doctorListReqVO ___" +
            doctorListReqVO.toJson().toString());
        Future<DoctorListResVO?> patientAppointmentResVO =
        API.getDoctorList(doctorListReqVO);
        patientAppointmentResVO.catchError(
              (onError) {
            print(onError.toString());
            showToastShortTime(context, onError.toString());
          },
        ).then((value) {
          if (value != null) {
            if (value.success == "1") {
              setState(() {

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
        });
      }
    });
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
                isScrollControlled: true,
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
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline2
                              ),
                              SizedBox(height: 8),
                              Text(
                                  'Specialty: ${doctor.specialty}', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText2),
                              SizedBox(height: 4),
                              Text('Hospital: ${doctor.hospital}', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText2),
                              SizedBox(height: 4),
                              Text('Address: ${doctor.address}', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText2),
                              SizedBox(height: 4),
                              Text('City: ${doctor.city}', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText2),
                              SizedBox(height: 4),
                              Text('Phone Number: ${doctor.phoneNumber}',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText2),
                              SizedBox(height: 4),
                              Text('Time: ${doctor.time}', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText2),
                              SizedBox(height: 4),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child:appointmentBookBtn(context)
                              )
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
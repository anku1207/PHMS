import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/model/response_model/DoctorDetailsVO.dart';
import 'package:phms/PHMS/model/response_model/patient/DoctorListResVO.dart';

import 'InfoRow.dart';

class DoctorDetails extends StatefulWidget {
  late final Data argument;

  DoctorDetails({required this.argument});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  late DoctorDetailsVO doctor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    doctor = DoctorDetailsVO(
      name: widget.argument.doctorname,
      specialty: widget.argument.specialisation,
      hospital: '',
      address: widget.argument.address,
      qualification: widget.argument.qualification,
      city: "",
      state: '',
      country: '',
      zipCode: '',
      phoneNumber: widget.argument.mobile,
      email: widget.argument.email,
      photoUrl: 'https://picsum.photos/200/300', // Replace with a valid URL
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Doctors Details'),
        ),
        body: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(doctor.photoUrl!),
                ),
                SizedBox(height: 16),
                Text(
                  doctor.name!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  doctor.specialty!,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 16),
                Container(
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoRow(label: 'Hospital', value: doctor.hospital!),
                          InfoRow(label: 'Specialisation', value: doctor.specialty!),
                          InfoRow(label: 'Qualification', value: doctor.qualification!),
                          InfoRow(label: 'Address', value: doctor.address!),
                          InfoRow(label: 'City', value: doctor.city!),
                          InfoRow(label: 'State', value: doctor.state!),
                          InfoRow(label: 'Country', value: doctor.country!),
                          InfoRow(label: 'Zip Code', value: doctor.zipCode!),
                          InfoRow(
                              label: 'Phone Number',
                              value: doctor.phoneNumber!),
                          InfoRow(label: 'Email', value: doctor.email!),
                          SizedBox(
                            height: 10.0,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child:appointmentBookBtn(context,widget.argument.doctorid!)
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseDetailsCard extends StatefulWidget {
  late final Object argument;
  CaseDetailsCard({required this.argument});
  @override
  State<CaseDetailsCard> createState() => _CaseDetailsCardState();
}

class _CaseDetailsCardState extends State<CaseDetailsCard> {

  var argumentsMap;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    argumentsMap = widget.argument as Map;

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Name: ${argumentsMap["patientName"]}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Appointment Time: ${argumentsMap["appointmentTime"]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Case Description:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(argumentsMap["caseDescription"], style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(
              'Diagnosis:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(argumentsMap["diagnosis"], style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(
              'Treatment:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(argumentsMap["treatment"], style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

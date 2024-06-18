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
            Text('Patient Name: ${argumentsMap["patientName"]}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 16)),
            SizedBox(height: 8),
            Text('Appointment Time:',
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 4),
            Text(argumentsMap["appointmentTime"],
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 8),
            Text('Case Description:',
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 4),
            Text(argumentsMap["caseDescription"],
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 8),
            Text('Diagnosis:', style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 4),
            Text(argumentsMap["diagnosis"],
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 8),
            Text('Treatment:', style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 4),
            Text(argumentsMap["treatment"],
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}

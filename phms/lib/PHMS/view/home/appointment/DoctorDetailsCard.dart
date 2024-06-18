import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorDetailsCard extends StatefulWidget {
  late final Object argument;
  DoctorDetailsCard({required this.argument});
  @override
  State<DoctorDetailsCard> createState() => _DoctorDetailsCardState();
}

class _DoctorDetailsCardState extends State<DoctorDetailsCard> {
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
              'Doctor Name: ${argumentsMap["doctorName"]}',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: 16)),
            SizedBox(height: 8),
            Text(
              'Specialization:',
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 8),
            Text(
                '${argumentsMap["specialization"]}',
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 8),
            Text(
              'Contact:',
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 8),
            Text(
                '${argumentsMap["contactNumber"]}',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}

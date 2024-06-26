import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancelAppointmentBottomSheet extends StatefulWidget {
  late final Object? argument;
  CancelAppointmentBottomSheet({required this.argument});

  @override
  State<CancelAppointmentBottomSheet> createState() => _CancelAppointmentBottomSheetState();
}

class _CancelAppointmentBottomSheetState extends State<CancelAppointmentBottomSheet> {
  final List<String> reasons = [
    "Personal Reasons",
    "Health Issues",
    "Scheduling Conflict",
    "Found Another Doctor",
    "Other"
  ];

  String? selectedReason;
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reason for Cancellation",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
                ),
                SizedBox(height: 16),
                Column(
                  children: reasons.map((reason) {
                    return RadioListTile<String>(
                      contentPadding: EdgeInsets.symmetric(vertical: 0), // Remove extra padding
                      dense: true,
                      title: Text(reason,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      value: reason,
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                    );
                  }).toList(),
                ),
                if (selectedReason == "Other") ...[
                  SizedBox(height: 16),
                  TextField(
                    style: Theme.of(context).textTheme.bodyText2,
                    controller: _commentController,
                    decoration: InputDecoration(
                      labelText: "Reason for cancellation",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ],
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the cancellation logic
                      String? reason = selectedReason;
                      String? comment = _commentController.text;
                      // TODO: Implement your logic to handle the cancellation
                      print("Reason: $reason");
                      print("Comment: $comment");

                      Navigator.pop(context);
                    },
                    child: Text("Submit"),
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
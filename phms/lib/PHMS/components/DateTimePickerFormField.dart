import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Validations.dart';

class CustomDateTimePickerFormField extends StatefulWidget {
  late TextEditingController dateTimeController;

  CustomDateTimePickerFormField(this.dateTimeController);
  @override
  _CustomDateTimePickerFormFieldState createState() =>
      _CustomDateTimePickerFormFieldState();
}

class _CustomDateTimePickerFormFieldState
    extends State<CustomDateTimePickerFormField> {
  DateTime? selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.blue, // Set your desired color
                accentColor: Colors.blue, // Set your desired color
                buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
              ),
              child: child!,
            ),
          );
        },
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          updateText();
        });
      }
    }
  }

  void updateText() {
    if (selectedDateTime != null) {
      final formattedDateTime =
      DateFormat('yyyy-MM-dd hh:mm:ss').format(selectedDateTime!);
      widget.dateTimeController.text = formattedDateTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () => _selectDateTime(context),
      controller: widget.dateTimeController,
      decoration: InputDecoration(
        labelText: 'Select Date and Time',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      validator: (value) =>
          validateRequiredField(value!),
    );
  }
}
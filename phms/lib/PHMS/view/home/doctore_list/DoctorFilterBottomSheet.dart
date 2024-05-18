import 'package:flutter/material.dart';

class DoctorFilterBottomSheet extends StatefulWidget {
  final Function(Map<String, String>) onFilterApplied;

  const DoctorFilterBottomSheet({required this.onFilterApplied});

  @override
  _DoctorFilterBottomSheetState createState() => _DoctorFilterBottomSheetState();
}

class _DoctorFilterBottomSheetState extends State<DoctorFilterBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _filters = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Doctor Name'),
              onSaved: (value) {
                _filters['doctorName'] = value ?? '';
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Specialty'),
              onSaved: (value) {
                _filters['specialty'] = value ?? '';
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Hospital'),
              onSaved: (value) {
                _filters['hospital'] = value ?? '';
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'City'),
              onSaved: (value) {
                _filters['city'] = value ?? '';
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'State'),
              onSaved: (value) {
                _filters['state'] = value ?? '';
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Country'),
              onSaved: (value) {
                _filters['country'] = value ?? '';
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState?.save();
                widget.onFilterApplied(_filters);
                Navigator.pop(context);
              },
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
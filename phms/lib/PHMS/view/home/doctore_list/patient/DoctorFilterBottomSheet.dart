import 'package:flutter/material.dart';

class DoctorFilterBottomSheet extends StatefulWidget {
  final Function(Map<String, String>) onFilterApplied;

  const DoctorFilterBottomSheet({required this.onFilterApplied});

  @override
  _DoctorFilterBottomSheetState createState() =>
      _DoctorFilterBottomSheetState();
}

class _DoctorFilterBottomSheetState extends State<DoctorFilterBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _filters = {};

  final List<String> specialties = [
    'Cardiology',
    'Neurology',
    'Pediatrics'
  ]; // Example specialties
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago'
  ]; // Example cities

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                style: Theme.of(context).textTheme.bodyText2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Doctor Name',
                  labelText: 'Doctor Name',
                  prefixIcon: const Icon(
                    Icons.supervised_user_circle,
                    color: Colors.grey,
                  ),
                  prefixText: ' ',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
                onSaved: (value) {
                  _filters['doctorName'] = value ?? '';
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Speciality',
                  labelStyle: TextStyle(fontSize: 10),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                ),
                items: specialties.map((String specialty) {
                  return DropdownMenuItem<String>(
                    value: specialty,
                    child: Text(specialty,
                        style: Theme.of(context).textTheme.bodyText2),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _filters['specialty'] = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                style: Theme.of(context).textTheme.bodyText2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Hospital',
                  labelText: 'Hospital',
                  prefixIcon: const Icon(
                    Icons.local_hospital,
                    color: Colors.grey,
                  ),
                  prefixText: ' ',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
                onSaved: (value) {
                  _filters['hospital'] = value ?? '';
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                style: Theme.of(context).textTheme.bodyText2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Near By Area',
                  labelText: 'Near By Area',
                  prefixIcon: const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  prefixText: ' ',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
                onSaved: (value) {
                  _filters['area'] = value ?? '';
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(fontSize: 10),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                  hintText: 'City',
                  // Provide a hint text
                  hintStyle: TextStyle(
                      color: Colors.amber), // Change the placeholder color
                ),
                items: cities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child:
                    Text(city, style: Theme.of(context).textTheme.bodyText2),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _filters['city'] = newValue!;
                  });
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
        )
      ),
    );
  }
}

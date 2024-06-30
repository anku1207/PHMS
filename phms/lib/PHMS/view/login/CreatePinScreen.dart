import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/components/constants.dart';

class CreatePinScreen extends StatefulWidget {
  late final Object argument;

  CreatePinScreen({required this.argument});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPinMatched = true;

  void _validatePin() {
    if (_pinController.text == _confirmPinController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PIN created successfully!')),
      );
    } else {
      setState(() {
        _isPinMatched = false;
      });
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  Widget _buildPinField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      style: Theme.of(context).textTheme.bodyText2,
      keyboardType: TextInputType.number,
      maxLength: 4,
      decoration: /*InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        counter: Offstage(),
      ),*/InputDecoration(
        hintText: '$label',
        labelText: '$label',
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
        prefixText: ' ',
        counter: Offstage(),
        contentPadding: new EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 20.0),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.length != 4) {
          return 'Please enter a valid 4-digit PIN';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UavPrimaryColor,
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200.0,
                ),
                // Image Container
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      child: Image.asset(
                        'assets/images/login.png',
                        height: 60.0, // Set the height of the image
                        width: 60.0, // Set the width of the image
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // To minimize the height of the Column
                        children: <Widget>[
                          Text(
                            "Create PIN",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                          ),
                          Container(
                            height: 10,
                            width: 100,
                            alignment: Alignment.center,
                            child: Divider(
                              color: Color(0xff6200ee),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  width: double.infinity,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _buildPinField(_pinController, 'Enter PIN'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _buildPinField(
                                      _confirmPinController, 'Confirm PIN'),
                                  if (!_isPinMatched)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'PINs do not match',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  SizedBox(height: 20),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity, // Makes the button full width
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _validatePin();
                                        }
                                      },
                                      child: Text('Create PIN'),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}

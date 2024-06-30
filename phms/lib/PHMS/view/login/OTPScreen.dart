import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';

class OTPScreen extends StatefulWidget {
  late final Object argument;

  OTPScreen({required this.argument});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late List<TextEditingController> _controllers;
  bool _isResendButtonEnabled = false;
  late Timer _timer;
  int _start = 120;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (index) => TextEditingController());
    _startTimer();
  }

  void _startTimer() {
    _start = 120;
    _isResendButtonEnabled = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isResendButtonEnabled = true;
        });
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _resendOTP() {
    // Logic to resend OTP
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
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
                            "OTP Verification",
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
                      padding: const EdgeInsets.only(
                          top: 50.0, left: 20.0, right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Enter the OTP sent to your phone',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          SizedBox(height: 20),
                          _buildOTPSingleField(4),
                          SizedBox(height: 20),
                          _isResendButtonEnabled
                              ? TextButton(
                                  onPressed: _isResendButtonEnabled
                                      ? _resendOTP
                                      : null,
                                  child: Text(
                                    'Resend OTP',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                )
                              : Container(),
                          SizedBox(height: 10),
                          _isResendButtonEnabled
                              ? Container()
                              : Text(
                                  'You can resend OTP in $_start seconds',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ]),
    );
  }

  Widget _buildOTPSingleField(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: TextField(
              controller: _controllers[index],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counter: Offstage(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onChanged: (value) {
                if (value.length == 1 && index < 3) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
                _checkOTPComplete();

              },
            ),
          ),
        );
      }),
    );
  }

  void _checkOTPComplete() {
    if (_controllers.every((controller) => controller.text.length == 1)) {
      String otp = _controllers.map((controller) => controller.text).join();

      showToastLongTime(context, otp);
      Navigator.pushNamed(
          context,
          UavRoutes
              .Create_Pin_Screen,arguments: {});
    }
  }
}

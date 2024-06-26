import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/Validations.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:phms/PHMS/model/request_model/LoginRequestVO.dart';
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart';
import 'package:phms/PHMS/service/http_service/RegisterAPI.dart' as API;
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;

  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidate;
  bool mobileNumberValidate = false;

  late TextEditingController userNameId;
  late TextEditingController passwordId;
  int selectedAccountType = 1; // 1 for doctor, 2 for patient

  late Login login;
  late LoginRequestVO loginRequestVO;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autoValidate = AutovalidateMode.disabled;
    mobileNumberValidate = false;

    userNameId = new TextEditingController();
    passwordId = new TextEditingController();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
      if (EasyLoading.isShow)
        return false;
      else
        return true;
    },
    child: Scaffold(
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
                        height: 60.0,  // Set the height of the image
                        width: 60.0,   // Set the width of the image
                      ),
                    ),
                  ),
                ),
                // Text Section
                Positioned.fill(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              "Choose Account Type For Login",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis, // Optional: Display ellipsis if the text overflows
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 200,
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
                          top: 20.0, left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Card(
                                  color: selectedAccountType == 1
                                      ? Activity_Box_Select_Color
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(
                                      color: UavPrimaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center, // Align the entire Column vertically centered
                                      children: [
                                        Image.asset(
                                          'assets/images/doctor_logo.png',
                                          height: 40.0,  // Set the height of the image
                                          width: 40.0,   // Set the width of the image
                                          color: UavPrimaryColor,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Doctor',
                                          style: Theme.of(context).textTheme.bodyText2,
                                        ),
                                        Radio<int>(
                                          value: 1,
                                          groupValue: selectedAccountType,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedAccountType = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Card(
                                  color: selectedAccountType == 2
                                      ? Activity_Box_Select_Color
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(
                                      color: UavPrimaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:CrossAxisAlignment.center ,// Align the entire Column vertically centered
                                      children: [
                                        Image.asset(
                                          'assets/images/patient_logo.png',
                                          height: 40.0,  // Set the height of the image
                                          width: 40.0,   // Set the width of the image
                                          color: UavPrimaryColor,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Patient',
                                          style: Theme.of(context).textTheme.bodyText2,
                                        ),
                                        Radio<int>(
                                          value: 2,
                                          groupValue: selectedAccountType,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedAccountType = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                              key: _formKey,
                              autovalidateMode: _autoValidate,
                              child: Column(children: <Widget>[

                                TextFormField(
                                  controller: userNameId,
                                  maxLength: 10,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    counter: Offstage(),
                                    hintText: 'Mobile Number',
                                    labelText: 'Mobile Number',
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      color: Colors.grey,
                                    ),
                                    prefixText: ' ',
                                    contentPadding: new EdgeInsets
                                        .symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                  ),
                                  validator: (value) =>
                                      validateMobileNumber(value!),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: passwordId,
                                  obscureText: _isHidden,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    prefixText: ' ',
                                    suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(
                                        _isHidden
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                    ),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                  ),
                                  validator: (value) =>
                                      validateRequiredField(value),
                                ),
                              ])),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context,
                                      UavRoutes
                                          .OTP_SCREEN,arguments: {});
                                },
                                child: Text(
                                  "Forgot Password ?",
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    login = Login(username: userNameId.text, logintype: selectedAccountType == 1?"D" :"P", password: passwordId.text);
                                    loginRequestVO = LoginRequestVO(login: login);

                                    userLogin(context,loginRequestVO);
                                  }
                                },
                                child: Text("LOGIN",
                                  style:
                                  Theme.of(context).textTheme.button!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    if (selectedAccountType == 1) {
                                      Navigator.pushNamed(context,
                                          UavRoutes.Doctor_registration_Screen);
                                    } else {
                                      Navigator.pushNamed(
                                          context,
                                          UavRoutes
                                              .Patient_registration_Screen);
                                    }
                                  },
                                  child: Text(
                                    "Didn\'t have account ? Sign Up Now",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ]),
    ));
  }

  void userLogin(BuildContext context,LoginRequestVO loginRequestVO){
    FocusScope.of(context).requestFocus(FocusNode());

    print("userLogin_data ___" + loginRequestVO.toJson().toString());
    Future<LoginResponseVO?> categoryListResponse =
    API.login(loginRequestVO);
    categoryListResponse.catchError(
          (onError) {
        print(onError.toString());
        showToastShortTime(context, onError.toString());
      },
    ).then((value) async {
      if (value != null) {
        if (value.success == "1") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(LOGIN_DATA, jsonEncode(value.data![0].toJson()));
          prefs.setString(USER_LOGIN_TYPE,selectedAccountType.toString());


          Navigator.pushNamedAndRemoveUntil(
            context,
            UavRoutes.Home_Screen,
                (route) => false,
          );
        } else {
          showAlertDialog(
              context: context,
              btnNameOk: "Ok",
              btnNameCancel: null,
              title: "Oops! ",
              message: value.message!);
        }
      }
    }).whenComplete(() {
      print("called when future completes");
      EasyLoading.dismiss();
    });
  }
}

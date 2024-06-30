import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/UiUtility.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';
import 'package:phms/PHMS/components/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  void startTimer() {
    int _start = 0;
    const oneSec = const Duration(seconds: 2);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          _timer.cancel();
          getLocation();
          //_startApplication();


        } else {
          _start--;
        }
      },
    );
  }

  void getLocation() {
    _determinePosition().catchError(
          (onError) async {
        print(onError.toString());
        showToastShortTime(context, onError.toString());
        showPermissionDialog(onError.toString());
      },
    ).then((value) async {
      if (value != null) {
        print(value.latitude.toString() + "===" + value.longitude.toString());
        //setting the details in session manager
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(CACHE_LOCATION_LAT, value.latitude.toString());
        prefs.setString(CACHE_LOCATION_LON, value.longitude.toString());

        _startApplication();
      } else {
        showSnackBar(context, "else");
      }
    }).whenComplete(() {
      EasyLoading.dismiss();
      print("called when future completes");
    });
  }

  Future<Position?> _determinePosition() async {
    EasyLoading.show(status: 'wait...');

    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      showToastShortTime(context, "serviceEnabled");
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission().catchError((onError) {
        showToastShortTime(context, onError.toString());
      });
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
  showPermissionDialog(String string) async {
    String? dialogResp = await showAlertDialog(
        context: context,
        btnNameOk: "ok",
        btnNameCancel: "cancel",
        title: "Permission ",
        message: "Need GPS permission for getting your location ");
    if (dialogResp != null && dialogResp.toLowerCase() == "ok") {
      getLocation();
    } else {
      SystemNavigator.pop();
    }
  }

  _startApplication(){
    checkCustomerSession().then((value) {
      if (value != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          UavRoutes.Home_Screen,
              (route) => false,
        );
      }else{
        Navigator.pushReplacementNamed(context, UavRoutes.Login_Screen);
      }
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
        child: Container(
            child: Scaffold(
              backgroundColor: Activity_Button_BG_Color,
                body: Center(
                  /*child: Lottie.asset('assets/images/splash_animation.json',
                  animate: true,
                  repeat: true)
                  ,*/
                  child: new Image.asset('assets/images/splash_logo.png',
                    color: Activity_Icon_Color_White,),
                ))));

  }
}


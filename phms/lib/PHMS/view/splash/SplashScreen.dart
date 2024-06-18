import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:phms/PHMS/components/Session.dart';
import 'package:phms/PHMS/components/constants.dart';
import 'package:phms/PHMS/components/routes.dart';

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
        } else {
          _start--;
        }
      },
    );
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


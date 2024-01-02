import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/model/DoctorRegistrationVO.dart';
import 'package:phms/PHMS/view/home/DashboardScreen.dart';
import 'package:phms/PHMS/view/home/HomeScreen.dart';
import 'package:phms/PHMS/view/home/ProductScreen.dart';
import 'package:phms/PHMS/view/login/LoginScreen.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationDetailsScreen.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationHospitalDetails.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationHospitalDetailsSecondScreen.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationScreen.dart';
import 'package:phms/PHMS/view/registration/patient_registration/PatientRegistrationScreen.dart';
import 'package:phms/PHMS/view/splash/SplashScreen.dart';



import 'BouncyPage.dart';


class UavRoutes {
  static const Splash_Screen = "/splash_screen";
  static const Login_Screen = "/login_screen";
  static const Doctor_registration_Screen = "/doctor_registration";
  static const Patient_registration_Screen = "/patient_registration";
  static const Doctor_Registration_Details_Screen = "/doctor_registration_details";
  static const Doctor_Registration_Hospital_Details_Screen = "/doctor_registration_hospital_details";
  static const Doctor_Registration_Hospital_Details_Second_Screen = "/doctor_registration_hospital_details_second";

  static const Dashboard_Screen = "/dashboard";
  static const Home_Screen = "/home";

  static const Product_Screen = "/product";



}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      case UavRoutes.Splash_Screen:
        return BouncyPage(widget: SplashView()); //PageRouteBuilder(pageBuilder: (_, __, ___) => SplashView());
      case UavRoutes.Login_Screen:
        return BouncyPage(widget: LoginScreen()); //PageRouteBuilder(pageBuilder: (_, __, ___) => SplashView());
      case UavRoutes.Doctor_registration_Screen:
        return BouncyPage(widget: DoctorRegistrationScreen());
      case UavRoutes.Patient_registration_Screen:
        return BouncyPage(widget: PatientRegistrationScreen());
      case UavRoutes.Doctor_Registration_Details_Screen:
        return BouncyPage(widget: DoctorRegistrationDetailsScreen());
      case UavRoutes.Doctor_Registration_Hospital_Details_Screen:
        return BouncyPage(widget: DoctorRegistrationHospitalDetailsScreen(argument:settings.arguments! as Registration));
      case UavRoutes.Doctor_Registration_Hospital_Details_Second_Screen:
        return BouncyPage(widget: DoctorRegistrationHospitalDetailsSecondScreen(argument:settings.arguments! as Registration));
      case UavRoutes.Dashboard_Screen:
        return BouncyPage(widget: DashboardScreen());
      case UavRoutes.Home_Screen:
        return BouncyPage(widget: HomeScreen());
      case UavRoutes.Product_Screen:
        return BouncyPage(widget: ProductScreen());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> homeRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      case UavRoutes.Product_Screen:
        return BouncyPage(widget: ProductScreen());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return BouncyPage(widget: HomeScreen());;
    }
  }


  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

}

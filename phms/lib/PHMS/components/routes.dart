import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/model/request_model/DoctorRegistrationVO.dart';
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';
import 'package:phms/PHMS/view/home/DashboardScreen.dart';
import 'package:phms/PHMS/view/home/HomeScreen.dart';
import 'package:phms/PHMS/view/home/ProductScreen.dart';
import 'package:phms/PHMS/view/home/appointment/AppointmentList.dart';
import 'package:phms/PHMS/view/home/history/HistoryScreen_1.dart';
import 'package:phms/PHMS/view/home/patient_history/PatientHistoryScreen_1.dart';
import 'package:phms/PHMS/view/home/patient_history/PatientHistoryScreen_2.dart';
import 'package:phms/PHMS/view/home/patient_history/PatientHistoryScreen_3.dart';
import 'package:phms/PHMS/view/home/registercase/PatientCaseRegisterScreen_1.dart';
import 'package:phms/PHMS/view/home/registercase/PatientCaseRegisterScreen_2.dart';
import 'package:phms/PHMS/view/home/registercase/PatientCaseRegisterScreen_3.dart';
import 'package:phms/PHMS/view/login/LoginScreen.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationDetailsScreen.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationHospitalDetails.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationHospitalDetailsSecondScreen.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationScreen.dart';
import 'package:phms/PHMS/view/registration/patient_registration/PatientRegistrationDetailsScreen.dart';
import 'package:phms/PHMS/view/registration/patient_registration/PatientRegistrationScreen.dart';
import 'package:phms/PHMS/view/splash/SplashScreen.dart';



import 'BouncyPage.dart';


class UavRoutes {
  static const Splash_Screen = "/splash_screen";
  static const Login_Screen = "/login_screen";
  static const Doctor_registration_Screen = "/doctor_registration";
  static const Patient_registration_Screen = "/patient_registration";
  static const Patient_registration_details_Screen = "/patient_registration_details";

  static const Doctor_Registration_Details_Screen = "/doctor_registration_details";
  static const Doctor_Registration_Hospital_Details_Screen = "/doctor_registration_hospital_details";
  static const Doctor_Registration_Hospital_Details_Second_Screen = "/doctor_registration_hospital_details_second";
  static const Patient_case_register_screen_1 = "/patient_case_register_screen_1";
  static const Patient_case_register_screen_2 = "/patient_case_register_screen_2";
  static const Patient_case_register_screen_3 = "/patient_case_register_screen_3";
  static const Patient_history_screen_1 = "/patient_history_screen_1";
  static const Patient_history_screen_2 = "/patient_history_screen_2";
  static const Patient_history_screen_3 = "/patient_history_screen_3";
  static const Appointment_list = "/appointment_list";

  static const History_screen_1 = "/history_screen_1";

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
      case UavRoutes.Patient_registration_details_Screen:
        return BouncyPage(widget: PatientRegistrationDetailsScreen(argument: settings.arguments!,));
      case UavRoutes.Doctor_Registration_Details_Screen:
        return BouncyPage(widget: DoctorRegistrationDetailsScreen(argument:settings.arguments!));
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
      case UavRoutes.Patient_case_register_screen_1:
        return BouncyPage(widget: PatientCaseRegisterScreen_1(argument: settings.arguments!));
      case UavRoutes.Patient_case_register_screen_2:
        return BouncyPage(widget: PatientCaseRegisterScreen_2(argument: settings.arguments! as Data));
      case UavRoutes.Patient_case_register_screen_3:
        return BouncyPage(widget: PatientCaseRegisterScreen_3(argument: settings.arguments! as Data));
      case UavRoutes.Patient_history_screen_1 :
        return BouncyPage(widget: PatientHistoryScreen_1(argument: settings.arguments!));
      case UavRoutes.Patient_history_screen_2 :
        return BouncyPage(widget: PatientHistoryScreen_2(argument: settings.arguments! as Data));
      case UavRoutes.Patient_history_screen_3 :
        return BouncyPage(widget: PatientHistoryScreen_3(argument: settings.arguments! as String));
      case UavRoutes.History_screen_1 :
        return BouncyPage(widget: HistoryScreen_1(argument: settings.arguments!));
      case UavRoutes.Appointment_list :
        return BouncyPage(widget: AppointmentList(argument: settings.arguments!));
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
      case UavRoutes.Patient_case_register_screen_1:
        return BouncyPage(widget: PatientCaseRegisterScreen_1(argument: settings.arguments!));
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

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:phms/PHMS/model/request_model/DoctorRegistrationVO.dart';
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';
import 'package:phms/PHMS/model/response_model/RegistrationArgs.dart';
import 'package:phms/PHMS/view/home/DashboardScreen.dart';
import 'package:phms/PHMS/view/home/HomeScreen.dart';
import 'package:phms/PHMS/view/home/ProductScreen.dart';
import 'package:phms/PHMS/view/home/appointment/patient/AppointmentTab.dart';
import 'package:phms/PHMS/view/home/appointment/doctor/AppointmentList.dart';
import 'package:phms/PHMS/view/home/appointment/patient/BookAppointment.dart';
import 'package:phms/PHMS/view/home/doctore_list/patient/DoctorDetails.dart';
import 'package:phms/PHMS/view/home/doctore_list/patient/DoctorList.dart';
import 'package:phms/PHMS/view/home/history/HistoryScreen_1.dart';
import 'package:phms/PHMS/view/home/patient_history/Patient/CaseHistoryTab.dart';
import 'package:phms/PHMS/view/home/appointment/patient/PatientCaseDetailsScreen.dart';
import 'package:phms/PHMS/view/home/patient_history/PDFViewerScreen.dart';
import 'package:phms/PHMS/view/home/patient_history/Doctor/PatientHistoryScreen_1.dart';
import 'package:phms/PHMS/view/home/patient_history/Doctor/PatientHistoryScreen_2.dart';
import 'package:phms/PHMS/view/home/patient_history/Doctor/PatientHistoryScreen_3.dart';
import 'package:phms/PHMS/view/home/registercase/Doctor/PatientCaseRegisterScreen_1.dart';
import 'package:phms/PHMS/view/home/registercase/Doctor/PatientCaseRegisterScreen_2.dart';
import 'package:phms/PHMS/view/home/registercase/Doctor/PatientCaseRegisterScreen_3.dart';
import 'package:phms/PHMS/view/login/CreatePinScreen.dart';
import 'package:phms/PHMS/view/login/LoginScreen.dart';
import 'package:phms/PHMS/view/login/OTPScreen.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationDetailsScreen.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationHospitalDetails.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationHospitalDetailsSecondScreen.dart';
import 'package:phms/PHMS/view/registration/doctor_registration/DoctorRegistrationScreen.dart';
import 'package:phms/PHMS/view/registration/patient_registration/PatientRegistrationDetailsScreen.dart';
import 'package:phms/PHMS/view/registration/patient_registration/PatientRegistrationScreen.dart';
import 'package:phms/PHMS/view/splash/SplashScreen.dart';
import 'package:phms/PHMS/model/response_model/patient/DoctorListResVO.dart' as DoctorListResVO;



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
  static const Case_History_Tab="/case_history_tab";
  static const Patient_history_screen_1 = "/patient_history_screen_1";
  static const Patient_history_screen_2 = "/patient_history_screen_2";
  static const Patient_history_screen_3 = "/patient_history_screen_3";
  static const Appointment_list = "/appointment_list";
  static const Book_Appointment = "/book_appointment";
  static const Appointment_list_grid = "/appointment_list_grid";
  static const Doctor_Details = "/doctor_details";
  static const Patient_Case_Details_Screen = "/patient_case_details_screen";
  static const PDF_Viewer_Screen = "/pdf_viewer_screen";
  static const OTP_SCREEN = "/otp_screen";
  static const Create_Pin_Screen = "/create_pin_screen";






  static const History_screen_1 = "/history_screen_1";

  static const Dashboard_Screen = "/dashboard";
  static const Home_Screen = "/home";

  static const Product_Screen = "/product";

  static const Doctor_List = "/doctor_list";


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
        return BouncyPage(widget: DoctorRegistrationHospitalDetailsScreen(registrationArgs:settings.arguments! as RegistrationArgs));
      case UavRoutes.Doctor_Registration_Hospital_Details_Second_Screen:
        return BouncyPage(widget: DoctorRegistrationHospitalDetailsSecondScreen(registrationArgs:settings.arguments! as RegistrationArgs));
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
      case UavRoutes.Book_Appointment :
        return BouncyPage(widget: BookAppointment(argument: settings.arguments!));
      case UavRoutes.Appointment_list_grid :
        return BouncyPage(widget: AppointmentTab(argument: settings.arguments!));
      case UavRoutes.Doctor_List :
        return BouncyPage(widget: DoctorList(argument: settings.arguments!));
      case UavRoutes.Case_History_Tab :
        return BouncyPage(widget: CaseHistoryTab(argument: settings.arguments!));
      case UavRoutes.Doctor_Details :
        return BouncyPage(widget: DoctorDetails(argument: settings.arguments! as DoctorListResVO.Data));
      case UavRoutes.Patient_Case_Details_Screen :
        return BouncyPage(widget: PatientCaseDetailsScreen(argument: settings.arguments!));
      case UavRoutes.PDF_Viewer_Screen :
        return BouncyPage(widget: PDFViewerScreen(pdfUrl:settings.arguments! as String));
      case UavRoutes.OTP_SCREEN :
        return BouncyPage(widget: OTPScreen(argument:settings.arguments!));
      case UavRoutes.Create_Pin_Screen :
        return BouncyPage(widget: CreatePinScreen(argument:settings.arguments!));
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

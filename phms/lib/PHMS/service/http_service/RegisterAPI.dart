import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:phms/PHMS/model/request_model/CaseRegRequestVO.dart';
import 'package:phms/PHMS/model/request_model/CaseSummaryDoctorRequestVO.dart';
import 'package:phms/PHMS/model/request_model/CheckDoctorRegistrationRequestVO.dart';
import 'package:phms/PHMS/model/request_model/CheckPatientRegistrationReqeust.dart';
import 'package:phms/PHMS/model/request_model/DoctorRegistrationVO.dart';
import 'package:phms/PHMS/model/request_model/LoginRequestVO.dart';
import 'package:phms/PHMS/model/request_model/PatientDetailsRequestVO.dart';
import 'package:phms/PHMS/model/request_model/PatientRegistrationRequestVO.dart';
import 'package:phms/PHMS/model/response_model/CaseRegResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CaseSummaryDoctorResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CheckDoctorRegistrationResponse.dart';
import 'package:phms/PHMS/model/response_model/CheckPatientRegistrationResponseVO.dart';
import 'package:phms/PHMS/model/response_model/DoctorRegistrationResponseVO.dart';
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart';
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';

import '../../../main.dart';
import 'ApiUrl.dart';



Future<CheckDoctorRegistrationResponse?> checkDoctor(CheckDoctorRegistrationRequestVO checkDoctorRegistrationRequestVO) async {
  EasyLoading.show(status: 'loading...');
  print("createUser");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/checkDoctor');
  var response = await http.post(url, headers: headers,body: json.encode(checkDoctorRegistrationRequestVO.toJson()));
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return CheckDoctorRegistrationResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}


Future<CheckPatientRegistrationResponseVO?> checkPatient(CheckPatientRegistrationReqeustVO checkPatientRegistrationReqeustVO) async {
  EasyLoading.show(status: 'loading...');
  print("createUser");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/checkPatient');
  var response = await http.post(url, headers: headers,body: json.encode(checkPatientRegistrationReqeustVO.toJson()));
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return CheckPatientRegistrationResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}



Future<DoctorRegistrationResponseVO?> registerDoctor(DoctorRegistrationVO registrationRequestVO) async {
  EasyLoading.show(status: 'loading...');
  print("createUser");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/doctorReg');
  var response = await http.post(url, headers: headers,body: json.encode(registrationRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return DoctorRegistrationResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}

Future<PatientDetailsResponseVO?> registerPatient(PatientRegistrationRequestVO patientRegistrationRequestVO) async {
  EasyLoading.show(status: 'loading...');
  print("registerPatient");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/patientReg');
  var response = await http.post(url, headers: headers,body: json.encode(patientRegistrationRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return PatientDetailsResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}


Future<LoginResponseVO?> login(LoginRequestVO loginRequestVO) async {
  EasyLoading.show(status: 'loading...');
  print("createUser");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/loginJson');
  var response = await http.post(url, headers: headers,body: json.encode(loginRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return LoginResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}


Future<PatientDetailsResponseVO?> getPatientDetails(PatientDetailsRequestVO patientDetailsRequestVO) async {
  EasyLoading.show(status: 'loading...');
  print("createUser");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/patientDetails');
  var response = await http.post(url, headers: headers,body: json.encode(patientDetailsRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return PatientDetailsResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}

Future<CaseRegResponseVO?> caseRegister(CaseRegRequestVO caseRegRequestVO) async {
  EasyLoading.show(status: 'loading...');
  print("caseRegister");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/caseReg_Photos');
  var response = await http.post(url, headers: headers,body: json.encode(caseRegRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return CaseRegResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}


Future<CaseSummaryDoctorResponseVO?> patientCaseSummary(CaseSummaryDoctorRequestVO caseSummaryDoctorRequestVO) async {
  EasyLoading.show(status: 'loading...');
  print("caseRegister");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/CaseSummary_Doctor');
  var response = await http.post(url, headers: headers,body: json.encode(caseSummaryDoctorRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return CaseSummaryDoctorResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}

void httpRequestDebugging(http.Response response){
  alice.onHttpResponse(response);
}



import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:phms/PHMS/model/request_model/AppointmentListRequestVO.dart';
import 'package:phms/PHMS/model/request_model/CaseDetailsRequestVO.dart';
import 'package:phms/PHMS/model/request_model/CaseRegRequestVO.dart';
import 'package:phms/PHMS/model/request_model/CaseSummaryDoctorRequestVO.dart';
import 'package:phms/PHMS/model/request_model/CheckDoctorRegistrationRequestVO.dart';
import 'package:phms/PHMS/model/request_model/CheckPatientRegistrationReqeust.dart';
import 'package:phms/PHMS/model/request_model/DoctorRegistrationVO.dart';
import 'package:phms/PHMS/model/request_model/LoginRequestVO.dart';
import 'package:phms/PHMS/model/request_model/PatientDetailsRequestVO.dart';
import 'package:phms/PHMS/model/request_model/PatientRegistrationRequestVO.dart';
import 'package:phms/PHMS/model/request_model/patient/CreateAppointmentReqVO.dart';
import 'package:phms/PHMS/model/request_model/patient/DoctorListReqVO.dart';
import 'package:phms/PHMS/model/request_model/patient/EditAppointmentReqVO.dart';
import 'package:phms/PHMS/model/response_model/AreaListResVO.dart';
import 'package:phms/PHMS/model/response_model/DoctorRegisterResVO.dart';
import 'package:phms/PHMS/model/response_model/PlaceTypeResVO.dart';
import 'package:phms/PHMS/model/response_model/QualificationResModel.dart';
import 'package:phms/PHMS/model/response_model/SpecialitiesListResVO.dart';
import 'package:phms/PHMS/model/response_model/patient/CreateAppointmentResVO.dart';
import 'package:phms/PHMS/model/response_model/patient/DoctorListResVO.dart';
import 'package:phms/PHMS/model/response_model/patient/EditAppointmentResVO.dart';
import 'package:phms/PHMS/model/response_model/patient/PatientAppointmentListResVO.dart';
import 'package:phms/PHMS/model/request_model/patient/PatientAppointmentReqVO.dart';
import 'package:phms/PHMS/model/response_model/AppointmentListResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CaseDetialsResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CaseRegResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CaseSummaryDoctorResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CaseSummaryResponseVO.dart';
import 'package:phms/PHMS/model/response_model/CheckDoctorRegistrationResponse.dart';
import 'package:phms/PHMS/model/response_model/CheckPatientRegistrationResponseVO.dart';
import 'package:phms/PHMS/model/response_model/DoctorRegistrationResponseVO.dart';
import 'package:phms/PHMS/model/response_model/LoginResponseVO.dart';
import 'package:phms/PHMS/model/response_model/PatientDetailsResponseVO.dart';

import '../../../main.dart';
import 'ApiUrl.dart';



Future<CheckDoctorRegistrationResponse?> checkDoctor(CheckDoctorRegistrationRequestVO checkDoctorRegistrationRequestVO) async {
  EasyLoading.show(status: 'Loading...');
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
  EasyLoading.show(status: 'Loading...');
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

Future<DoctorRegisterResVO?> registerDoctor(DoctorRegistrationVO registrationRequestVO) async {
  EasyLoading.show(status: 'Loading...');
  print("registerDoctor");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/doctorReg');
  var response = await http.post(url, headers: headers,body: json.encode(registrationRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return DoctorRegisterResVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to registerDoctor Data');
  }
}



Future<DoctorRegistrationResponseVO?> addDoctorPlace(DoctorRegistrationVO registrationRequestVO) async {
  EasyLoading.show(status: 'Loading...');
  print("createUser");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/AddPlace');
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
  EasyLoading.show(status: 'Loading...');
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
  EasyLoading.show(status: 'Loading...');
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
  EasyLoading.show(status: 'Loading...');
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
  EasyLoading.show(status: 'Loading...');
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
  EasyLoading.show(status: 'Loading...');
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

Future<CaseDetialsResponseVO?> caseDetails(CaseDetailsRequestVO detailsRequestVO) async {
  EasyLoading.show(status: 'Loading...');
  print("caseRegister");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/casedetails');
  var response = await http.post(url, headers: headers,body: json.encode(detailsRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return CaseDetialsResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}

Future<CaseSummaryResponseVO?> caseSummary(CaseSummaryDoctorRequestVO caseSummaryDoctorRequestVO) async {
  EasyLoading.show(status: 'Loading...');
  print("caseRegister");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/casesummary');
  var response = await http.post(url, headers: headers,body: json.encode(caseSummaryDoctorRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return CaseSummaryResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}


Future<AppointmentListResponseVO?> getAppointmentList(AppointmentListRequestVO appointmentListRequestVO) async {
  EasyLoading.show(status: 'Loading...');
  print("getAppointmentList");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/ViewAppointments_Doc');
  var response = await http.post(url, headers: headers,body: json.encode(appointmentListRequestVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return AppointmentListResponseVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}

Future<PatientAppointmentListResVO?> getPatientAppointmentList(PatientAppointmentReqVO patientAppointmentReqVO) async {
  EasyLoading.show(status: 'Loading...');
  print("getAppointmentList");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/ViewAppointments_Patient');
  var response = await http.post(url, headers: headers,body: json.encode(patientAppointmentReqVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return PatientAppointmentListResVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}

Future<DoctorListResVO?> getDoctorList(DoctorListReqVO doctorListReqVO) async {
  EasyLoading.show(status: 'Loading...');
  print("getDoctorList");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/ViewDoctor');
  var response = await http.post(url, headers: headers,body: json.encode(doctorListReqVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return DoctorListResVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to createUser Data');
  }
}

Future<SpecialitiesListResVO?> getSpecialitiesList() async {
  EasyLoading.show(status: 'Loading...');
  print("getSpecialitiesList");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/ViewSpecialities');
  var response = await http.post(url, headers: headers,body: json.encode(null),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return SpecialitiesListResVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to getSpecialitiesList Data');
  }
}
Future<QualificationResModel?> getQualificationList() async {
  EasyLoading.show(status: 'Loading...');
  print("getQualificationList");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/ViewQualifications');
  var response = await http.post(url, headers: headers,body: json.encode(null),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return QualificationResModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to getQualificationList Data');
  }
}

Future<PlaceTypeResVO?> getPlaceTypeList() async {
  EasyLoading.show(status: 'Loading...');
  print("getPlaceTypeList");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/ViewPlaceType');
  var response = await http.post(url, headers: headers,body: json.encode(null),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return PlaceTypeResVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to getPlaceTypeList Data');
  }
}


Future<AreaListResVO?> getAreaList() async {
  EasyLoading.show(status: 'Loading...');
  print("getAreaList");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/ViewLocation');
  var response = await http.post(url, headers: headers,body: json.encode(null),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return AreaListResVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to getPlaceTypeList Data');
  }
}


Future<CreateAppointmentResVO?> bookAppointment(CreateAppointmentReqVO createAppointmentReqVO) async {
  EasyLoading.show(status: 'Loading...');
  print("bookAppointment");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/CreateAppointment');
  var response = await http.post(url, headers: headers,body: json.encode(createAppointmentReqVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return CreateAppointmentResVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to bookAppointment Data');
  }
}

Future<EditAppointmentResVO?> editAppointment(EditAppointmentReqVO appointmentReqVO) async {
  EasyLoading.show(status: 'Loading...');
  print("editAppointment");
  Map<String, String> headers = await getApiHeaders();

  var url = Uri.parse(ApiUrl.BASE_URL + 'Service1.svc/EditAppointment');
  var response = await http.post(url, headers: headers,body: json.encode(appointmentReqVO.toJson()),);
  httpRequestDebugging(response);
  print(response.body);
  if (response.statusCode == 200) {
    return EditAppointmentResVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to editAppointment Data');
  }
}

void httpRequestDebugging(http.Response response){
  alice.onHttpResponse(response);
}



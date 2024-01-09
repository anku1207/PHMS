import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:phms/PHMS/model/request_model/CheckDoctorRegistrationRequestVO.dart';
import 'package:phms/PHMS/model/request_model/DoctorRegistrationVO.dart';
import 'package:phms/PHMS/model/response_model/CheckDoctorRegistrationResponse.dart';
import 'package:phms/PHMS/model/response_model/DoctorRegistrationResponseVO.dart';

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

void httpRequestDebugging(http.Response response){
  alice.onHttpResponse(response);
}



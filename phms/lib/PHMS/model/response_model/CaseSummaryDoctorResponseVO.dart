/// success : "1"
/// message : "Case(s) Found"
/// data : [{"caseID":"64","casedatetime":"1/24/2024 8:02:44 AM","patientname":"manoj t","mobile":"7597048883","soap_pic":"https://phmsdoc.s3.ap-south-1.amazonaws.com/prescription_1_37_64.jpg?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARTRSUHROUKN6U3HS%2F20240124%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20240124T153948Z&X-Amz-SignedHeaders=host&X-Amz-Signature=f27a41878a96932c5a7baa39dcc83fd5cb96f20d75a3d6a4aba438385d27eae1","reports":""},{"caseID":"63","casedatetime":"1/22/2024 4:14:18 AM","patientname":"manoj t","mobile":"7597048883","soap_pic":"https://phmsdoc.s3.ap-south-1.amazonaws.com/prescription_1_37_63.jpg?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARTRSUHROUKN6U3HS%2F20240124%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20240124T153948Z&X-Amz-SignedHeaders=host&X-Amz-Signature=7d58ce7e9f043b1e96e15ee2583fd6133c059074345559fdd7e3c0477f223cc8","reports":""},{"caseID":"60","casedatetime":"1/20/2024 3:21:25 AM","patientname":"manoj t","mobile":"7597048883","soap_pic":"https://phmsdoc.s3.ap-south-1.amazonaws.com/prescription_1_37.jpg?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARTRSUHROUKN6U3HS%2F20240124%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20240124T153948Z&X-Amz-SignedHeaders=host&X-Amz-Signature=998d91b66251e90bb85d527e1e1e3659404b8601a7478164efd5d9f31b173d03","reports":""},{"caseID":"58","casedatetime":"1/20/2024 3:14:53 AM","patientname":"manoj t","mobile":"7597048883","soap_pic":"https://phmsdoc.s3.ap-south-1.amazonaws.com/prescription_1_37.jpg?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARTRSUHROUKN6U3HS%2F20240124%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20240124T153948Z&X-Amz-SignedHeaders=host&X-Amz-Signature=998d91b66251e90bb85d527e1e1e3659404b8601a7478164efd5d9f31b173d03","reports":""},{"caseID":"57","casedatetime":"1/20/2024 3:14:34 AM","patientname":"manoj t","mobile":"7597048883","soap_pic":"https://phmsdoc.s3.ap-south-1.amazonaws.com/prescription_1_37.jpg?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARTRSUHROUKN6U3HS%2F20240124%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20240124T153948Z&X-Amz-SignedHeaders=host&X-Amz-Signature=998d91b66251e90bb85d527e1e1e3659404b8601a7478164efd5d9f31b173d03","reports":""}]

class CaseSummaryDoctorResponseVO {
  CaseSummaryDoctorResponseVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CaseSummaryDoctorResponseVO.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _success;
  String? _message;
  List<Data>? _data;

  String? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// caseID : "64"
/// casedatetime : "1/24/2024 8:02:44 AM"
/// patientname : "manoj t"
/// mobile : "7597048883"
/// soap_pic : "https://phmsdoc.s3.ap-south-1.amazonaws.com/prescription_1_37_64.jpg?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARTRSUHROUKN6U3HS%2F20240124%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20240124T153948Z&X-Amz-SignedHeaders=host&X-Amz-Signature=f27a41878a96932c5a7baa39dcc83fd5cb96f20d75a3d6a4aba438385d27eae1"
/// reports : ""

class Data {
  Data({
      String? caseID, 
      String? casedatetime, 
      String? patientname, 
      String? mobile, 
      String? soapPic, 
      String? reports,}){
    _caseID = caseID;
    _casedatetime = casedatetime;
    _patientname = patientname;
    _mobile = mobile;
    _soapPic = soapPic;
    _reports = reports;
}

  Data.fromJson(dynamic json) {
    _caseID = json['caseID'];
    _casedatetime = json['casedatetime'];
    _patientname = json['patientname'];
    _mobile = json['mobile'];
    _soapPic = json['soap_pic'];
    _reports = json['reports'];
  }
  String? _caseID;
  String? _casedatetime;
  String? _patientname;
  String? _mobile;
  String? _soapPic;
  String? _reports;

  String? get caseID => _caseID;
  String? get casedatetime => _casedatetime;
  String? get patientname => _patientname;
  String? get mobile => _mobile;
  String? get soapPic => _soapPic;
  String? get reports => _reports;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['caseID'] = _caseID;
    map['casedatetime'] = _casedatetime;
    map['patientname'] = _patientname;
    map['mobile'] = _mobile;
    map['soap_pic'] = _soapPic;
    map['reports'] = _reports;
    return map;
  }

}
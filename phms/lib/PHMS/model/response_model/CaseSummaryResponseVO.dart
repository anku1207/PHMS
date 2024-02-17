/// success : "1"
/// message : "Case(s) Found"
/// data : [{"caseID":"69","casedatetime":"2/9/2024 5:02:22 AM","doctorname":"manoj","mobile":"7597048883","soap_pic":"","reports":""},{"caseID":"68","casedatetime":"2/8/2024 3:19:27 PM","doctorname":"manoj","mobile":"7597048883","soap_pic":"","reports":""},{"caseID":"67","casedatetime":"2/8/2024 6:32:50 AM","doctorname":"manoj","mobile":"7597048883","soap_pic":"","reports":""},{"caseID":"66","casedatetime":"1/27/2024 1:13:27 PM","doctorname":"manoj","mobile":"7597048883","soap_pic":"","reports":""},{"caseID":"65","casedatetime":"1/27/2024 7:27:37 AM","doctorname":"manoj","mobile":"7597048883","soap_pic":"","reports":""}]

class CaseSummaryResponseVO {
  CaseSummaryResponseVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CaseSummaryResponseVO.fromJson(dynamic json) {
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

/// caseID : "69"
/// casedatetime : "2/9/2024 5:02:22 AM"
/// doctorname : "manoj"
/// mobile : "7597048883"
/// soap_pic : ""
/// reports : ""

class Data {
  Data({
      String? caseID, 
      String? casedatetime, 
      String? doctorname, 
      String? mobile, 
      String? soapPic, 
      String? reports,}){
    _caseID = caseID;
    _casedatetime = casedatetime;
    _doctorname = doctorname;
    _mobile = mobile;
    _soapPic = soapPic;
    _reports = reports;
}

  Data.fromJson(dynamic json) {
    _caseID = json['caseID'];
    _casedatetime = json['casedatetime'];
    _doctorname = json['doctorname'];
    _mobile = json['mobile'];
    _soapPic = json['soap_pic'];
    _reports = json['reports'];
  }
  String? _caseID;
  String? _casedatetime;
  String? _doctorname;
  String? _mobile;
  String? _soapPic;
  String? _reports;

  String? get caseID => _caseID;
  String? get casedatetime => _casedatetime;
  String? get doctorname => _doctorname;
  String? get mobile => _mobile;
  String? get soapPic => _soapPic;
  String? get reports => _reports;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['caseID'] = _caseID;
    map['casedatetime'] = _casedatetime;
    map['doctorname'] = _doctorname;
    map['mobile'] = _mobile;
    map['soap_pic'] = _soapPic;
    map['reports'] = _reports;
    return map;
  }

}
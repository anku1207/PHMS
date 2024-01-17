/// success : "1"
/// message : "Patient(s) Found"
/// data : [{"userid":"1","customerName":"ABC","SessionID":"2nsryvzbaw5aarr4b34kddjr"}]

class LoginResponseVO {
  LoginResponseVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  LoginResponseVO.fromJson(dynamic json) {
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

/// userid : "1"
/// customerName : "ABC"
/// SessionID : "2nsryvzbaw5aarr4b34kddjr"

class Data {
  Data({
      String? userid, 
      String? customerName, 
      String? sessionID,}){
    _userid = userid;
    _customerName = customerName;
    _sessionID = sessionID;
}

  Data.fromJson(dynamic json) {
    _userid = json['userid'];
    _customerName = json['customerName'];
    _sessionID = json['SessionID'];
  }
  String? _userid;
  String? _customerName;
  String? _sessionID;

  String? get userid => _userid;
  String? get customerName => _customerName;
  String? get sessionID => _sessionID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = _userid;
    map['customerName'] = _customerName;
    map['SessionID'] = _sessionID;
    return map;
  }

}
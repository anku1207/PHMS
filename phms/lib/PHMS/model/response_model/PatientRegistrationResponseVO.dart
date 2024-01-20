/// success : "1"
/// message : "Patient Registered Successful"
/// data : [{"customerID":"6"}]

class PatientRegistrationResponseVO {
  PatientRegistrationResponseVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  PatientRegistrationResponseVO.fromJson(dynamic json) {
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

/// customerID : "6"

class Data {
  Data({
      String? customerID,}){
    _customerID = customerID;
}

  Data.fromJson(dynamic json) {
    _customerID = json['customerID'];
  }
  String? _customerID;

  String? get customerID => _customerID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerID'] = _customerID;
    return map;
  }

}
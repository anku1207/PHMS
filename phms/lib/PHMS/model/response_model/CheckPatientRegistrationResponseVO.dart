/// success : "1"
/// message : "Patient Already Exists"
/// data : [{"patientID":"1"}]

class CheckPatientRegistrationResponseVO {
  CheckPatientRegistrationResponseVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CheckPatientRegistrationResponseVO.fromJson(dynamic json) {
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

/// patientID : "1"

class Data {
  Data({
      String? patientID,}){
    _patientID = patientID;
}

  Data.fromJson(dynamic json) {
    _patientID = json['patientID'];
  }
  String? _patientID;

  String? get patientID => _patientID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patientID'] = _patientID;
    return map;
  }

}
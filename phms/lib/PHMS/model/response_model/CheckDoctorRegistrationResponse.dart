/// success : "0"
/// message : "Doctor Does Not Exist"
/// data : [{"doctorID":"0"}]

class CheckDoctorRegistrationResponse {
  CheckDoctorRegistrationResponse({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CheckDoctorRegistrationResponse.fromJson(dynamic json) {
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

/// doctorID : "0"

class Data {
  Data({
      String? doctorID,}){
    _doctorID = doctorID;
}

  Data.fromJson(dynamic json) {
    _doctorID = json['doctorID'];
  }
  String? _doctorID;

  String? get doctorID => _doctorID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorID'] = _doctorID;
    return map;
  }

}
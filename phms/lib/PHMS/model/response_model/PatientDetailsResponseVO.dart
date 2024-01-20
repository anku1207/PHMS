/// success : "0"
/// message : "Patient(s) Not Found"
/// data : [{"patientID":"0","patientname":"","mobile":"7597048886","email":"","bloodgroup":"","dob":"","gender":""}]

class PatientDetailsResponseVO {
  PatientDetailsResponseVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  PatientDetailsResponseVO.fromJson(dynamic json) {
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

/// patientID : "0"
/// patientname : ""
/// mobile : "7597048886"
/// email : ""
/// bloodgroup : ""
/// dob : ""
/// gender : ""

class Data {
  Data({
      String? patientID, 
      String? patientname, 
      String? mobile, 
      String? email, 
      String? bloodgroup, 
      String? dob, 
      String? gender,}){
    _patientID = patientID;
    _patientname = patientname;
    _mobile = mobile;
    _email = email;
    _bloodgroup = bloodgroup;
    _dob = dob;
    _gender = gender;
}

  Data.fromJson(dynamic json) {
    _patientID = json['patientID'];
    _patientname = json['patientname'];
    _mobile = json['mobile'];
    _email = json['email'];
    _bloodgroup = json['bloodgroup'];
    _dob = json['dob'];
    _gender = json['gender'];
  }
  String? _patientID;
  String? _patientname;
  String? _mobile;
  String? _email;
  String? _bloodgroup;
  String? _dob;
  String? _gender;

  String? get patientID => _patientID;
  String? get patientname => _patientname;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get bloodgroup => _bloodgroup;
  String? get dob => _dob;
  String? get gender => _gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patientID'] = _patientID;
    map['patientname'] = _patientname;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['bloodgroup'] = _bloodgroup;
    map['dob'] = _dob;
    map['gender'] = _gender;
    return map;
  }

}
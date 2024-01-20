/// registration : {"patientname":"testhh","mobile":"7597048882","email":"manoj@gmail.com","location":"123","dob":"2024-01-18","bloodgrp":"AB+","doctorname":"","doctornumber":"","address":"address ","gender":"male","password":"1234"}

class PatientRegistrationRequestVO {
  PatientRegistrationRequestVO({
      Registration? registration,}){
    _registration = registration;
}

  PatientRegistrationRequestVO.fromJson(dynamic json) {
    _registration = json['registration'] != null ? Registration.fromJson(json['registration']) : null;
  }
  Registration? _registration;

  Registration? get registration => _registration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_registration != null) {
      map['registration'] = _registration?.toJson();
    }
    return map;
  }

}

/// patientname : "testhh"
/// mobile : "7597048882"
/// email : "manoj@gmail.com"
/// location : "123"
/// dob : "2024-01-18"
/// bloodgrp : "AB+"
/// doctorname : ""
/// doctornumber : ""
/// address : "address "
/// gender : "male"
/// password : "1234"

class Registration {
  Registration({
      String? patientname, 
      String? mobile, 
      String? email, 
      String? location, 
      String? dob, 
      String? bloodgrp, 
      String? doctorname, 
      String? doctornumber, 
      String? address, 
      String? gender, 
      String? password,}){
    _patientname = patientname;
    _mobile = mobile;
    _email = email;
    _location = location;
    _dob = dob;
    _bloodgrp = bloodgrp;
    _doctorname = doctorname;
    _doctornumber = doctornumber;
    _address = address;
    _gender = gender;
    _password = password;
}

  Registration.fromJson(dynamic json) {
    _patientname = json['patientname'];
    _mobile = json['mobile'];
    _email = json['email'];
    _location = json['location'];
    _dob = json['dob'];
    _bloodgrp = json['bloodgrp'];
    _doctorname = json['doctorname'];
    _doctornumber = json['doctornumber'];
    _address = json['address'];
    _gender = json['gender'];
    _password = json['password'];
  }
  String? _patientname;
  String? _mobile;
  String? _email;
  String? _location;
  String? _dob;
  String? _bloodgrp;
  String? _doctorname;
  String? _doctornumber;
  String? _address;
  String? _gender;
  String? _password;

  String? get patientname => _patientname;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get location => _location;
  String? get dob => _dob;
  String? get bloodgrp => _bloodgrp;
  String? get doctorname => _doctorname;
  String? get doctornumber => _doctornumber;
  String? get address => _address;
  String? get gender => _gender;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patientname'] = _patientname;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['location'] = _location;
    map['dob'] = _dob;
    map['bloodgrp'] = _bloodgrp;
    map['doctorname'] = _doctorname;
    map['doctornumber'] = _doctornumber;
    map['address'] = _address;
    map['gender'] = _gender;
    map['password'] = _password;
    return map;
  }

}
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
  String? patientname;
  String? mobile;
  String? email;
  String? location;
  String? dob;
  String? bloodgrp;
  String? password;
  String? doctorname;
  String? doctornumber;
  String? gender;
  String? address;
  String? eCperson;
  String? eCmobile;


  Registration(
      {this.patientname,
        this.mobile,
        this.email,
        this.location,
        this.dob,
        this.bloodgrp,
        this.password,
        this.doctorname,
        this.doctornumber,
        this.gender,
        this.address,
        this.eCperson,
        this.eCmobile,
      });

  Registration.fromJson(Map<String, dynamic> json) {
    patientname = json['patientname'];
    mobile = json['mobile'];
    email = json['email'];
    location = json['location'];
    dob = json['dob'];
    bloodgrp = json['bloodgrp'];
    password = json['password'];
    doctorname = json['doctorname'];
    doctornumber = json['doctornumber'];
    gender = json['gender'];
    address = json['address'];
    eCperson = json['eCperson'];
    eCmobile = json['eCmobile'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientname'] = this.patientname;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['location'] = this.location;
    data['dob'] = this.dob;
    data['bloodgrp'] = this.bloodgrp;
    data['password'] = this.password;
    data['doctorname'] = this.doctorname;
    data['doctornumber'] = this.doctornumber;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['eCperson'] = this.eCperson;
    data['eCmobile'] = this.eCmobile;
    return data;
  }
}
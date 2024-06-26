/// success : "1"
/// message : "Doctor(s) Found"
/// data : [{"DOCTORID":"35","DOCTORNAME":"Test","QUALIFICATION":"MBBS","SPECIALISATION":"Physician","MOBILE":"7021526393","EMAIL":"test@abc.com","ADDRESS":"Test","PLACEID":"1"},{"DOCTORID":"1","DOCTORNAME":"Rahul","QUALIFICATION":"MD","SPECIALISATION":"Eye Surgeon","MOBILE":"9586582649","EMAIL":"test@xyz.com","ADDRESS":"Test","PLACEID":"1"},{"DOCTORID":"35","DOCTORNAME":"Test","QUALIFICATION":"MBBS","SPECIALISATION":"Physician","MOBILE":"7021526393","EMAIL":"test@abc.com","ADDRESS":"Test","PLACEID":"1"}]

class DoctorListResVO {
  DoctorListResVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  DoctorListResVO.fromJson(dynamic json) {
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

/// DOCTORID : "35"
/// DOCTORNAME : "Test"
/// QUALIFICATION : "MBBS"
/// SPECIALISATION : "Physician"
/// MOBILE : "7021526393"
/// EMAIL : "test@abc.com"
/// ADDRESS : "Test"
/// PLACEID : "1"

class Data {
  Data({
      String? doctorid, 
      String? doctorname, 
      String? qualification, 
      String? specialisation, 
      String? mobile, 
      String? email, 
      String? address, 
      String? placeid,}){
    _doctorid = doctorid;
    _doctorname = doctorname;
    _qualification = qualification;
    _specialisation = specialisation;
    _mobile = mobile;
    _email = email;
    _address = address;
    _placeid = placeid;
}

  Data.fromJson(dynamic json) {
    _doctorid = json['DOCTORID'];
    _doctorname = json['DOCTORNAME'];
    _qualification = json['QUALIFICATION'];
    _specialisation = json['SPECIALISATION'];
    _mobile = json['MOBILE'];
    _email = json['EMAIL'];
    _address = json['ADDRESS'];
    _placeid = json['PLACEID'];
  }
  String? _doctorid;
  String? _doctorname;
  String? _qualification;
  String? _specialisation;
  String? _mobile;
  String? _email;
  String? _address;
  String? _placeid;

  String? get doctorid => _doctorid;
  String? get doctorname => _doctorname;
  String? get qualification => _qualification;
  String? get specialisation => _specialisation;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get address => _address;
  String? get placeid => _placeid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DOCTORID'] = _doctorid;
    map['DOCTORNAME'] = _doctorname;
    map['QUALIFICATION'] = _qualification;
    map['SPECIALISATION'] = _specialisation;
    map['MOBILE'] = _mobile;
    map['EMAIL'] = _email;
    map['ADDRESS'] = _address;
    map['PLACEID'] = _placeid;
    return map;
  }

}
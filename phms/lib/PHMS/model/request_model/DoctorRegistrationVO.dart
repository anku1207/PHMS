/// registration : {"doctorname":"Test Doctor 3","mobile":"9920199203","email":"test3@xyz.com","landline":"","qualification":"MD","specialisation":"Eye Surgeon","regNumber":"M12991","password":"test@1234","place":[{"placename":"TEST 4","placetype":"1","doctorid":"1","mobile":"9820198102","email":"","landline":"","address":"vile parle east","visitinghrs":"10:00 – 12:00","visitingdays":"Mon - Wed"},{"placename":"TEST 5","placetype":"1","doctorid":"1","mobile":"9811298112","email":"","landline":"","address":"bandra west","visitinghrs":"16:00 – 18:00","visitingdays":"Thu - Fri"}]}

class DoctorRegistrationVO {
  DoctorRegistrationVO({
      Registration? registration,}){
    _registration = registration;
}

  DoctorRegistrationVO.fromJson(dynamic json) {
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

/// doctorname : "Test Doctor 3"
/// mobile : "9920199203"
/// email : "test3@xyz.com"
/// landline : ""
/// qualification : "MD"
/// specialisation : "Eye Surgeon"
/// regNumber : "M12991"
/// password : "test@1234"
/// place : [{"placename":"TEST 4","placetype":"1","doctorid":"1","mobile":"9820198102","email":"","landline":"","address":"vile parle east","visitinghrs":"10:00 – 12:00","visitingdays":"Mon - Wed"},{"placename":"TEST 5","placetype":"1","doctorid":"1","mobile":"9811298112","email":"","landline":"","address":"bandra west","visitinghrs":"16:00 – 18:00","visitingdays":"Thu - Fri"}]

class Registration {
  Registration({
      String? doctorname, 
      String? mobile, 
      String? email, 
      String? landline, 
      String? qualification, 
      String? specialisation, 
      String? regNumber, 
      String? password, 
      List<Place>? place,}){
    _doctorname = doctorname;
    _mobile = mobile;
    _email = email;
    _landline = landline;
    _qualification = qualification;
    _specialisation = specialisation;
    _regNumber = regNumber;
    _password = password;
    _place = place;
}

  Registration.fromJson(dynamic json) {
    _doctorname = json['doctorname'];
    _mobile = json['mobile'];
    _email = json['email'];
    _landline = json['landline'];
    _qualification = json['qualification'];
    _specialisation = json['specialisation'];
    _regNumber = json['regNumber'];
    _password = json['password'];
    if (json['place'] != null) {
      _place = [];
      json['place'].forEach((v) {
        _place?.add(Place.fromJson(v));
      });
    }
  }
  String? _doctorname;
  String? _mobile;
  String? _email;
  String? _landline;
  String? _qualification;
  String? _specialisation;
  String? _regNumber;
  String? _password;
  List<Place>? _place;

  String? get doctorname => _doctorname;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get landline => _landline;
  String? get qualification => _qualification;
  String? get specialisation => _specialisation;
  String? get regNumber => _regNumber;
  String? get password => _password;
  List<Place>? get place => _place;

  setPlace(List<Place> newPlace) {
    _place = newPlace;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorname'] = _doctorname;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['landline'] = _landline;
    map['qualification'] = _qualification;
    map['specialisation'] = _specialisation;
    map['regNumber'] = _regNumber;
    map['password'] = _password;
    if (_place != null) {
      map['place'] = _place?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// placename : "TEST 4"
/// placetype : "1"
/// doctorid : "1"
/// mobile : "9820198102"
/// email : ""
/// landline : ""
/// address : "vile parle east"
/// visitinghrs : "10:00 – 12:00"
/// visitingdays : "Mon - Wed"

class Place {
  String? placename;
  String? placetype;
  String? doctorid;
  String? mobile;
  String? email;
  String? landline;
  String? address;
  String? visitinghrs;
  String? visitingdays;
  String? areaID;
  String? lat;
  String? long;

  Place(
      {this.placename,
        this.placetype,
        this.doctorid,
        this.mobile,
        this.email,
        this.landline,
        this.address,
        this.visitinghrs,
        this.visitingdays,
        this.areaID,
        this.lat,
        this.long});

  Place.fromJson(Map<String, dynamic> json) {
    placename = json['placename'];
    placetype = json['placetype'];
    doctorid = json['doctorid'];
    mobile = json['mobile'];
    email = json['email'];
    landline = json['landline'];
    address = json['address'];
    visitinghrs = json['visitinghrs'];
    visitingdays = json['visitingdays'];
    areaID = json['areaID'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placename'] = this.placename;
    data['placetype'] = this.placetype;
    data['doctorid'] = this.doctorid;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['landline'] = this.landline;
    data['address'] = this.address;
    data['visitinghrs'] = this.visitinghrs;
    data['visitingdays'] = this.visitingdays;
    data['areaID'] = this.areaID;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}
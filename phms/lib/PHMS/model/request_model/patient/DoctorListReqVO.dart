/// place : {"doctorname":"","location":"","specialisation":""}

class DoctorListReqVO {
  DoctorListReqVO({
      Place? place,}){
    _place = place;
}

  DoctorListReqVO.fromJson(dynamic json) {
    _place = json['place'] != null ? Place.fromJson(json['place']) : null;
  }
  Place? _place;

  Place? get place => _place;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_place != null) {
      map['place'] = _place?.toJson();
    }
    return map;
  }

}

/// doctorname : ""
/// location : ""
/// specialisation : ""

class Place {
  Place({
      String? doctorname, 
      String? location, 
      String? specialisation,}){
    _doctorname = doctorname;
    _location = location;
    _specialisation = specialisation;
}

  Place.fromJson(dynamic json) {
    _doctorname = json['doctorname'];
    _location = json['location'];
    _specialisation = json['specialisation'];
  }
  String? _doctorname;
  String? _location;
  String? _specialisation;

  String? get doctorname => _doctorname;
  String? get location => _location;
  String? get specialisation => _specialisation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorname'] = _doctorname;
    map['location'] = _location;
    map['specialisation'] = _specialisation;
    return map;
  }

}
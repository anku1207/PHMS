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
  String? doctorname;
  String? location;
  String? specialisation;
  String? city;
  int? latitude;
  int? longitude;

  Place(
      {this.doctorname,
        this.location,
        this.specialisation,
        this.city,
        this.latitude,
        this.longitude});

  Place.fromJson(Map<String, dynamic> json) {
    doctorname = json['doctorname'];
    location = json['location'];
    specialisation = json['specialisation'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctorname'] = this.doctorname;
    data['location'] = this.location;
    data['specialisation'] = this.specialisation;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
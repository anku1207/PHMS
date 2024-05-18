/// doctorlist : [{"doctor_name":"test","specialty":"specialty","address":"address","hospital":"hospital","time":"time"}]

class DoctorListResponseVO {
  List<Doctorlist>? doctorlist;

  DoctorListResponseVO({this.doctorlist});

  DoctorListResponseVO.fromJson(Map<String, dynamic> json) {
    if (json['doctorlist'] != null) {
      doctorlist = <Doctorlist>[];
      json['doctorlist'].forEach((v) {
        doctorlist!.add(new Doctorlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctorlist != null) {
      data['doctorlist'] = this.doctorlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctorlist {
  String? doctorName;
  String? specialty;
  String? address;
  String? hospital;
  String? time;
  String? city;
  String? state;
  String? phoneNumber;
  String? country;
  String? zipCode;

  Doctorlist(
      {this.doctorName,
        this.specialty,
        this.address,
        this.hospital,
        this.time,
        this.city,
        this.state,
        this.phoneNumber,
        this.country,
        this.zipCode});

  Doctorlist.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
    specialty = json['specialty'];
    address = json['address'];
    hospital = json['hospital'];
    time = json['time'];
    city = json['city'];
    state = json['state'];
    phoneNumber = json['phone_number'];
    country = json['country'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_name'] = this.doctorName;
    data['specialty'] = this.specialty;
    data['address'] = this.address;
    data['hospital'] = this.hospital;
    data['time'] = this.time;
    data['city'] = this.city;
    data['state'] = this.state;
    data['phone_number'] = this.phoneNumber;
    data['country'] = this.country;
    data['zip_code'] = this.zipCode;
    return data;
  }
}
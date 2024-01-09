/// registration : {"mobile":"7777777777"}

class CheckDoctorRegistrationRequestVO {

  Registration? _registration;

  Registration? get registration => _registration;

  CheckDoctorRegistrationRequestVO({
    Registration? registration,
  }) {
    _registration = registration;
  }

  CheckDoctorRegistrationRequestVO.fromJson(dynamic json) {
    _registration = json['registration'] != null
        ? Registration.fromJson(json['registration'])
        : null;
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_registration != null) {
      map['registration'] = _registration?.toJson();
    }
    return map;
  }
}

/// mobile : "7777777777"

class Registration {
  Registration({
    String? mobile,
  }) {
    _mobile = mobile;
  }

  Registration.fromJson(dynamic json) {
    _mobile = json['mobile'];
  }

  String? _mobile;

  String? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    return map;
  }
}

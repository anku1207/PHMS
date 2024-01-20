/// registration : {"mobile":"7597048883"}

class CheckPatientRegistrationReqeustVO {
  CheckPatientRegistrationReqeustVO({
      Registration? registration,}){
    _registration = registration;
}

  CheckPatientRegistrationReqeustVO.fromJson(dynamic json) {
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

/// mobile : "7597048883"

class Registration {
  Registration({
      String? mobile,}){
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
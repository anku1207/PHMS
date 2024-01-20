/// case : {"mobile":"7597048886"}

class PatientDetailsRequestVO {
  PatientDetailsRequestVO({
      Case? casee,}){
    _case = casee;
}

  PatientDetailsRequestVO.fromJson(dynamic json) {
    _case = json['case'] != null ? Case.fromJson(json['case']) : null;
  }
  Case? _case;

  Case? get casee => _case;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_case != null) {
      map['case'] = _case?.toJson();
    }
    return map;
  }

}

/// mobile : "7597048886"

class Case {
  Case({
      String? mobile,}){
    _mobile = mobile;
}

  Case.fromJson(dynamic json) {
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
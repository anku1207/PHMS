/// case : {"doctorID":"1","fromDate":"","toDate":"","placeID":"","patientMobile":"","followup":""}

class AppointmentListRequestVO {
  AppointmentListRequestVO({Case? cases,}){
    _case = cases;
}

  AppointmentListRequestVO.fromJson(dynamic json) {
    _case = json['case'] != null ? Case.fromJson(json['case']) : null;
  }
  Case? _case;

  Case? get cases => _case;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_case != null) {
      map['case'] = _case?.toJson();
    }
    return map;
  }

}

/// doctorID : "1"
/// fromDate : ""
/// toDate : ""
/// placeID : ""
/// patientMobile : ""
/// followup : ""

class Case {
  Case({
      String? doctorID, 
      String? fromDate, 
      String? toDate, 
      String? placeID, 
      String? patientMobile, 
      String? followup,}){
    _doctorID = doctorID;
    _fromDate = fromDate;
    _toDate = toDate;
    _placeID = placeID;
    _patientMobile = patientMobile;
    _followup = followup;
}

  Case.fromJson(dynamic json) {
    _doctorID = json['doctorID'];
    _fromDate = json['fromDate'];
    _toDate = json['toDate'];
    _placeID = json['placeID'];
    _patientMobile = json['patientMobile'];
    _followup = json['followup'];
  }
  String? _doctorID;
  String? _fromDate;
  String? _toDate;
  String? _placeID;
  String? _patientMobile;
  String? _followup;

  String? get doctorID => _doctorID;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  String? get placeID => _placeID;
  String? get patientMobile => _patientMobile;
  String? get followup => _followup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorID'] = _doctorID;
    map['fromDate'] = _fromDate;
    map['toDate'] = _toDate;
    map['placeID'] = _placeID;
    map['patientMobile'] = _patientMobile;
    map['followup'] = _followup;
    return map;
  }

}
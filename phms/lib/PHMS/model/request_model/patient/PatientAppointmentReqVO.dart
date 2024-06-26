/// case : {"patientID":"1","fromDate":"","toDate":"","doctorID":"","followup":"Y"}

class PatientAppointmentReqVO {
  PatientAppointmentReqVO({
      Case? cases,}){
    _case = cases;
}

  PatientAppointmentReqVO.fromJson(dynamic json) {
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

/// patientID : "1"
/// fromDate : ""
/// toDate : ""
/// doctorID : ""
/// followup : "Y"

class Case {
  Case({
      String? patientID, 
      String? fromDate, 
      String? toDate, 
      String? doctorID, 
      String? followup,}){
    _patientID = patientID;
    _fromDate = fromDate;
    _toDate = toDate;
    _doctorID = doctorID;
    _followup = followup;
}

  Case.fromJson(dynamic json) {
    _patientID = json['patientID'];
    _fromDate = json['fromDate'];
    _toDate = json['toDate'];
    _doctorID = json['doctorID'];
    _followup = json['followup'];
  }
  String? _patientID;
  String? _fromDate;
  String? _toDate;
  String? _doctorID;
  String? _followup;

  String? get patientID => _patientID;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  String? get doctorID => _doctorID;
  String? get followup => _followup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patientID'] = _patientID;
    map['fromDate'] = _fromDate;
    map['toDate'] = _toDate;
    map['doctorID'] = _doctorID;
    map['followup'] = _followup;
    return map;
  }

}
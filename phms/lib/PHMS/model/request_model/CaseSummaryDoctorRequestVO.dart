/// case : {"patientID":"1","doctorID":"37"}

class CaseSummaryDoctorRequestVO {
  CaseSummaryDoctorRequestVO({
      Case? cases,}){
    _case = cases;
}

  CaseSummaryDoctorRequestVO.fromJson(dynamic json) {
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
/// doctorID : "37"

class Case {
  Case({
      String? patientID, 
      String? doctorID,}){
    _patientID = patientID;
    _doctorID = doctorID;
}

  Case.fromJson(dynamic json) {
    _patientID = json['patientID'];
    _doctorID = json['doctorID'];
  }
  String? _patientID;
  String? _doctorID;

  String? get patientID => _patientID;
  String? get doctorID => _doctorID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patientID'] = _patientID;
    map['doctorID'] = _doctorID;
    return map;
  }

}
/// case : {"doctorID":"1","patientID":"2","placeID":"5","appointmentdatetime":"","reason":"","appointmentBy":"Patient"}

class CreateAppointmentReqVO {
  CreateAppointmentReqVO({
      Case? cases,}){
    _case = cases;
}

  CreateAppointmentReqVO.fromJson(dynamic json) {
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
/// patientID : "2"
/// placeID : "5"
/// appointmentdatetime : ""
/// reason : ""
/// appointmentBy : "Patient"

class Case {
  Case({
      String? doctorID, 
      String? patientID, 
      String? placeID, 
      String? appointmentdatetime, 
      String? reason, 
      String? appointmentBy,}){
    _doctorID = doctorID;
    _patientID = patientID;
    _placeID = placeID;
    _appointmentdatetime = appointmentdatetime;
    _reason = reason;
    _appointmentBy = appointmentBy;
}

  Case.fromJson(dynamic json) {
    _doctorID = json['doctorID'];
    _patientID = json['patientID'];
    _placeID = json['placeID'];
    _appointmentdatetime = json['appointmentdatetime'];
    _reason = json['reason'];
    _appointmentBy = json['appointmentBy'];
  }
  String? _doctorID;
  String? _patientID;
  String? _placeID;
  String? _appointmentdatetime;
  String? _reason;
  String? _appointmentBy;

  String? get doctorID => _doctorID;
  String? get patientID => _patientID;
  String? get placeID => _placeID;
  String? get appointmentdatetime => _appointmentdatetime;
  String? get reason => _reason;
  String? get appointmentBy => _appointmentBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorID'] = _doctorID;
    map['patientID'] = _patientID;
    map['placeID'] = _placeID;
    map['appointmentdatetime'] = _appointmentdatetime;
    map['reason'] = _reason;
    map['appointmentBy'] = _appointmentBy;
    return map;
  }

}
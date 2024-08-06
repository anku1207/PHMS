/// case : {"appointmentID":"2","appStatus":"Re-Scheduled","doctorID":"1","patientID":"1","placeID":"1","olddatetime":"2018-05-10 16:30:00","reason":"Emergency","appointmentBy":"Patient","newdatetime":"2018-06-10 16:30:00"}

class EditAppointmentReqVO {
  EditAppointmentReqVO({
      Case? cases,}){
    _case = cases;
}

  EditAppointmentReqVO.fromJson(dynamic json) {
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

/// appointmentID : "2"
/// appStatus : "Re-Scheduled"
/// doctorID : "1"
/// patientID : "1"
/// placeID : "1"
/// olddatetime : "2018-05-10 16:30:00"
/// reason : "Emergency"
/// appointmentBy : "Patient"
/// newdatetime : "2018-06-10 16:30:00"

class Case {
  Case({
      String? appointmentID, 
      String? appStatus, 
      String? doctorID, 
      String? patientID, 
      String? placeID, 
      String? olddatetime, 
      String? reason, 
      String? appointmentBy, 
      String? newdatetime,}){
    _appointmentID = appointmentID;
    _appStatus = appStatus;
    _doctorID = doctorID;
    _patientID = patientID;
    _placeID = placeID;
    _olddatetime = olddatetime;
    _reason = reason;
    _appointmentBy = appointmentBy;
    _newdatetime = newdatetime;
}

  Case.fromJson(dynamic json) {
    _appointmentID = json['appointmentID'];
    _appStatus = json['appStatus'];
    _doctorID = json['doctorID'];
    _patientID = json['patientID'];
    _placeID = json['placeID'];
    _olddatetime = json['olddatetime'];
    _reason = json['reason'];
    _appointmentBy = json['appointmentBy'];
    _newdatetime = json['newdatetime'];
  }
  String? _appointmentID;
  String? _appStatus;
  String? _doctorID;
  String? _patientID;
  String? _placeID;
  String? _olddatetime;
  String? _reason;
  String? _appointmentBy;
  String? _newdatetime;

  String? get appointmentID => _appointmentID;
  String? get appStatus => _appStatus;
  String? get doctorID => _doctorID;
  String? get patientID => _patientID;
  String? get placeID => _placeID;
  String? get olddatetime => _olddatetime;
  String? get reason => _reason;
  String? get appointmentBy => _appointmentBy;
  String? get newdatetime => _newdatetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointmentID'] = _appointmentID;
    map['appStatus'] = _appStatus;
    map['doctorID'] = _doctorID;
    map['patientID'] = _patientID;
    map['placeID'] = _placeID;
    map['olddatetime'] = _olddatetime;
    map['reason'] = _reason;
    map['appointmentBy'] = _appointmentBy;
    map['newdatetime'] = _newdatetime;
    return map;
  }

}
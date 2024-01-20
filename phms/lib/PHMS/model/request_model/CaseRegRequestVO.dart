/// case : {"doctorID":"37","patientID":"1","symptoms":"symptoms ","prescription":"prescription ","notes":"notes ","symptoms_pic":"","prescription_pic":"","notes_pic":"","symptoms_img":"symptoms_1_37.jpg","prescription_img":"prescription_1_37.jpg","notes_img":"note_1_37.jpg","followup":"Y","appointmentdatetime":"2024-01-19 21:57:27","reason":"res","appointmentID":"0","existingCaseID":"0","placeID":"5","scheduleID":"0"}

class CaseRegRequestVO {
  CaseRegRequestVO({
      Case? casee,}){
    _case = casee;
}

  CaseRegRequestVO.fromJson(dynamic json) {
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

/// doctorID : "37"
/// patientID : "1"
/// symptoms : "symptoms "
/// prescription : "prescription "
/// notes : "notes "
/// symptoms_pic : ""
/// prescription_pic : ""
/// notes_pic : ""
/// symptoms_img : "symptoms_1_37.jpg"
/// prescription_img : "prescription_1_37.jpg"
/// notes_img : "note_1_37.jpg"
/// followup : "Y"
/// appointmentdatetime : "2024-01-19 21:57:27"
/// reason : "res"
/// appointmentID : "0"
/// existingCaseID : "0"
/// placeID : "5"
/// scheduleID : "0"

class Case {
  Case({
      String? doctorID, 
      String? patientID, 
      String? symptoms, 
      String? prescription, 
      String? notes, 
      String? symptomsPic, 
      String? prescriptionPic, 
      String? notesPic, 
      String? symptomsImg, 
      String? prescriptionImg, 
      String? notesImg, 
      String? followup, 
      String? appointmentdatetime, 
      String? reason, 
      String? appointmentID, 
      String? existingCaseID, 
      String? placeID, 
      String? scheduleID,}){
    _doctorID = doctorID;
    _patientID = patientID;
    _symptoms = symptoms;
    _prescription = prescription;
    _notes = notes;
    _symptomsPic = symptomsPic;
    _prescriptionPic = prescriptionPic;
    _notesPic = notesPic;
    _symptomsImg = symptomsImg;
    _prescriptionImg = prescriptionImg;
    _notesImg = notesImg;
    _followup = followup;
    _appointmentdatetime = appointmentdatetime;
    _reason = reason;
    _appointmentID = appointmentID;
    _existingCaseID = existingCaseID;
    _placeID = placeID;
    _scheduleID = scheduleID;
}

  Case.fromJson(dynamic json) {
    _doctorID = json['doctorID'];
    _patientID = json['patientID'];
    _symptoms = json['symptoms'];
    _prescription = json['prescription'];
    _notes = json['notes'];
    _symptomsPic = json['symptoms_pic'];
    _prescriptionPic = json['prescription_pic'];
    _notesPic = json['notes_pic'];
    _symptomsImg = json['symptoms_img'];
    _prescriptionImg = json['prescription_img'];
    _notesImg = json['notes_img'];
    _followup = json['followup'];
    _appointmentdatetime = json['appointmentdatetime'];
    _reason = json['reason'];
    _appointmentID = json['appointmentID'];
    _existingCaseID = json['existingCaseID'];
    _placeID = json['placeID'];
    _scheduleID = json['scheduleID'];
  }
  String? _doctorID;
  String? _patientID;
  String? _symptoms;
  String? _prescription;
  String? _notes;
  String? _symptomsPic;
  String? _prescriptionPic;
  String? _notesPic;
  String? _symptomsImg;
  String? _prescriptionImg;
  String? _notesImg;
  String? _followup;
  String? _appointmentdatetime;
  String? _reason;
  String? _appointmentID;
  String? _existingCaseID;
  String? _placeID;
  String? _scheduleID;

  String? get doctorID => _doctorID;
  String? get patientID => _patientID;
  String? get symptoms => _symptoms;
  String? get prescription => _prescription;
  String? get notes => _notes;
  String? get symptomsPic => _symptomsPic;
  String? get prescriptionPic => _prescriptionPic;
  String? get notesPic => _notesPic;
  String? get symptomsImg => _symptomsImg;
  String? get prescriptionImg => _prescriptionImg;
  String? get notesImg => _notesImg;
  String? get followup => _followup;
  String? get appointmentdatetime => _appointmentdatetime;
  String? get reason => _reason;
  String? get appointmentID => _appointmentID;
  String? get existingCaseID => _existingCaseID;
  String? get placeID => _placeID;
  String? get scheduleID => _scheduleID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorID'] = _doctorID;
    map['patientID'] = _patientID;
    map['symptoms'] = _symptoms;
    map['prescription'] = _prescription;
    map['notes'] = _notes;
    map['symptoms_pic'] = _symptomsPic;
    map['prescription_pic'] = _prescriptionPic;
    map['notes_pic'] = _notesPic;
    map['symptoms_img'] = _symptomsImg;
    map['prescription_img'] = _prescriptionImg;
    map['notes_img'] = _notesImg;
    map['followup'] = _followup;
    map['appointmentdatetime'] = _appointmentdatetime;
    map['reason'] = _reason;
    map['appointmentID'] = _appointmentID;
    map['existingCaseID'] = _existingCaseID;
    map['placeID'] = _placeID;
    map['scheduleID'] = _scheduleID;
    return map;
  }

}
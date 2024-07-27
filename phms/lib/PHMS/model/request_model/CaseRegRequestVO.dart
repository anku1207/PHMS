/// case : {"doctorID":"37","patientID":"1","symptoms":"symptoms ","prescription":"prescription ","notes":"notes ","symptoms_pic":"","prescription_pic":"","notes_pic":"","symptoms_img":"symptoms_1_37.jpg","prescription_img":"prescription_1_37.jpg","notes_img":"note_1_37.jpg","followup":"Y","appointmentdatetime":"2024-01-19 21:57:27","reason":"res","appointmentID":"0","existingCaseID":"0","placeID":"5","scheduleID":"0"}

class CaseRegRequestVO {
  CaseRegRequestVO({
    Case? casee,
  }) {
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
  String? doctorID;
  String? patientID;
  String? symptoms;
  String? prescription;
  String? notes;
  String? prescriptionPic;
  String? prescriptionImg;
  String? existingCaseID;
  String? followup;
  String? placeID;
  String? appointmentdatetime;
  String? reason;
  String? appointmentID;
  String? scheduleID;
  String? labAdvice;
  String? radioAdvice;

  Case(
      {this.doctorID,
      this.patientID,
      this.symptoms,
      this.prescription,
      this.notes,
      this.prescriptionPic,
      this.prescriptionImg,
      this.existingCaseID,
      this.followup,
      this.placeID,
      this.appointmentdatetime,
      this.reason,
      this.appointmentID,
      this.scheduleID,
      this.labAdvice,
      this.radioAdvice});

  Case.fromJson(Map<String, dynamic> json) {
    doctorID = json['doctorID'];
    patientID = json['patientID'];
    symptoms = json['symptoms'];
    prescription = json['prescription'];
    notes = json['notes'];
    prescriptionPic = json['prescription_pic'];
    prescriptionImg = json['prescription_img'];
    existingCaseID = json['existingCaseID'];
    followup = json['followup'];
    placeID = json['placeID'];
    appointmentdatetime = json['appointmentdatetime'];
    reason = json['reason'];
    appointmentID = json['appointmentID'];
    scheduleID = json['scheduleID'];
    labAdvice = json['lab_advice'];
    radioAdvice = json['radio_advice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctorID'] = this.doctorID;
    data['patientID'] = this.patientID;
    data['symptoms'] = this.symptoms;
    data['prescription'] = this.prescription;
    data['notes'] = this.notes;
    data['prescription_pic'] = this.prescriptionPic;
    data['prescription_img'] = this.prescriptionImg;
    data['existingCaseID'] = this.existingCaseID;
    data['followup'] = this.followup;
    data['placeID'] = this.placeID;
    data['appointmentdatetime'] = this.appointmentdatetime;
    data['reason'] = this.reason;
    data['appointmentID'] = this.appointmentID;
    data['scheduleID'] = this.scheduleID;
    data['lab_advice'] = this.labAdvice;
    data['radio_advice'] = this.radioAdvice;
    return data;
  }
}

/// success : "1"
/// message : "Case Details Found"
/// data : [{"caseID":"65","casedatetime":"1/27/2024 7:27:37 AM","doctorname":"manoj","doctormobile":"7597048883","patientname":"manoj t","patientmobile":"7597048883","bloodgroup":"7597048883","DOB":"1/4/2024 12:00:00 AM","email":"manoj@gmail.com"}]
/// caseDetails : [{"casedetailsid":"65","followupdatetime":"1/27/2024 7:27:37 AM","doctorcharges":"","symptoms":"symptoms ","prescription":"prescription ","plan":"","soap_pic":"https://phmsdoc.s3.ap-south-1.amazonaws.com/prescription_1_37_65.jpg?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARTRSUHROUKN6U3HS%2F20240127%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20240127T125202Z&X-Amz-SignedHeaders=host&X-Amz-Signature=6786abc17d77d5d9b569ea9fdf2e38b4875a1b50ac05eb2e5cfd212d50b87098","report_type":"","report_desc":"","report_pic":"","reportamt":"","notes_desc":"notes"}]

class CaseDetialsResponseVO {
  CaseDetialsResponseVO({
    String? success,
    String? message,
    List<Data>? data,
    List<CaseDetails>? caseDetails,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _caseDetails = caseDetails;
  }

  CaseDetialsResponseVO.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    if (json['caseDetails'] != null) {
      _caseDetails = [];
      json['caseDetails'].forEach((v) {
        _caseDetails?.add(CaseDetails.fromJson(v));
      });
    }
  }

  String? _success;
  String? _message;
  List<Data>? _data;
  List<CaseDetails>? _caseDetails;

  String? get success => _success;

  String? get message => _message;

  List<Data>? get data => _data;

  List<CaseDetails>? get caseDetails => _caseDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_caseDetails != null) {
      map['caseDetails'] = _caseDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// casedetailsid : "65"
/// followupdatetime : "1/27/2024 7:27:37 AM"
/// doctorcharges : ""
/// symptoms : "symptoms "
/// prescription : "prescription "
/// plan : ""
/// soap_pic : "https://phmsdoc.s3.ap-south-1.amazonaws.com/prescription_1_37_65.jpg?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARTRSUHROUKN6U3HS%2F20240127%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20240127T125202Z&X-Amz-SignedHeaders=host&X-Amz-Signature=6786abc17d77d5d9b569ea9fdf2e38b4875a1b50ac05eb2e5cfd212d50b87098"
/// report_type : ""
/// report_desc : ""
/// report_pic : ""
/// reportamt : ""
/// notes_desc : "notes"

class CaseDetails {
  CaseDetails(
      {String? casedetailsid,
      String? followupdatetime,
      String? doctorcharges,
      String? symptoms,
      String? prescription,
      String? plan,
      String? soapPic,
      String? reportType,
      String? reportDesc,
      String? reportPic,
      String? reportamt,
      String? notesDesc,
      String? labAdvice,
      String? radioAdvice}) {
    _casedetailsid = casedetailsid;
    _followupdatetime = followupdatetime;
    _doctorcharges = doctorcharges;
    _symptoms = symptoms;
    _prescription = prescription;
    _plan = plan;
    _soapPic = soapPic;
    _reportType = reportType;
    _reportDesc = reportDesc;
    _reportPic = reportPic;
    _reportamt = reportamt;
    _notesDesc = notesDesc;
    _labAdvice = labAdvice;
    _radioAdvice = radioAdvice;
  }

  CaseDetails.fromJson(dynamic json) {
    _casedetailsid = json['casedetailsid'];
    _followupdatetime = json['followupdatetime'];
    _doctorcharges = json['doctorcharges'];
    _symptoms = json['symptoms'];
    _prescription = json['prescription'];
    _plan = json['plan'];
    _soapPic = json['soap_pic'];
    _reportType = json['report_type'];
    _reportDesc = json['report_desc'];
    _reportPic = json['report_pic'];
    _reportamt = json['reportamt'];
    _notesDesc = json['notes_desc'];
    _labAdvice = json['lab_advice'];
    _radioAdvice = json['radio_advice'];
  }

  String? _casedetailsid;
  String? _followupdatetime;
  String? _doctorcharges;
  String? _symptoms;
  String? _prescription;
  String? _plan;
  String? _soapPic;
  String? _reportType;
  String? _reportDesc;
  String? _reportPic;
  String? _reportamt;
  String? _notesDesc;
  String? _labAdvice;
  String? _radioAdvice;

  String? get casedetailsid => _casedetailsid;

  String? get followupdatetime => _followupdatetime;

  String? get doctorcharges => _doctorcharges;

  String? get symptoms => _symptoms;

  String? get prescription => _prescription;

  String? get plan => _plan;

  String? get soapPic => _soapPic;

  String? get reportType => _reportType;

  String? get reportDesc => _reportDesc;

  String? get reportPic => _reportPic;

  String? get reportamt => _reportamt;

  String? get labAdvice => _notesDesc;

  String? get notesDesc => _labAdvice;


  String? get radioAdvice => _radioAdvice;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['casedetailsid'] = _casedetailsid;
    map['followupdatetime'] = _followupdatetime;
    map['doctorcharges'] = _doctorcharges;
    map['symptoms'] = _symptoms;
    map['prescription'] = _prescription;
    map['plan'] = _plan;
    map['soap_pic'] = _soapPic;
    map['report_type'] = _reportType;
    map['report_desc'] = _reportDesc;
    map['report_pic'] = _reportPic;
    map['reportamt'] = _reportamt;
    map['notes_desc'] = _notesDesc;
    map['lab_advice'] = _labAdvice;
    map['radio_advice'] = _radioAdvice;
    return map;
  }
}

/// caseID : "65"
/// casedatetime : "1/27/2024 7:27:37 AM"
/// doctorname : "manoj"
/// doctormobile : "7597048883"
/// patientname : "manoj t"
/// patientmobile : "7597048883"
/// bloodgroup : "7597048883"
/// DOB : "1/4/2024 12:00:00 AM"
/// email : "manoj@gmail.com"

class Data {
  Data({
    String? caseID,
    String? casedatetime,
    String? doctorname,
    String? doctormobile,
    String? patientname,
    String? patientmobile,
    String? bloodgroup,
    String? dob,
    String? email,
  }) {
    _caseID = caseID;
    _casedatetime = casedatetime;
    _doctorname = doctorname;
    _doctormobile = doctormobile;
    _patientname = patientname;
    _patientmobile = patientmobile;
    _bloodgroup = bloodgroup;
    _dob = dob;
    _email = email;
  }

  Data.fromJson(dynamic json) {
    _caseID = json['caseID'];
    _casedatetime = json['casedatetime'];
    _doctorname = json['doctorname'];
    _doctormobile = json['doctormobile'];
    _patientname = json['patientname'];
    _patientmobile = json['patientmobile'];
    _bloodgroup = json['bloodgroup'];
    _dob = json['DOB'];
    _email = json['email'];
  }

  String? _caseID;
  String? _casedatetime;
  String? _doctorname;
  String? _doctormobile;
  String? _patientname;
  String? _patientmobile;
  String? _bloodgroup;
  String? _dob;
  String? _email;

  String? get caseID => _caseID;

  String? get casedatetime => _casedatetime;

  String? get doctorname => _doctorname;

  String? get doctormobile => _doctormobile;

  String? get patientname => _patientname;

  String? get patientmobile => _patientmobile;

  String? get bloodgroup => _bloodgroup;

  String? get dob => _dob;

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['caseID'] = _caseID;
    map['casedatetime'] = _casedatetime;
    map['doctorname'] = _doctorname;
    map['doctormobile'] = _doctormobile;
    map['patientname'] = _patientname;
    map['patientmobile'] = _patientmobile;
    map['bloodgroup'] = _bloodgroup;
    map['DOB'] = _dob;
    map['email'] = _email;
    return map;
  }
}

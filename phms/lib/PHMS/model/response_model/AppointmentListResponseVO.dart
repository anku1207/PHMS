/// success : "1"
/// message : "Reports(s) Found"
/// invoices : [{"appointmentID":"1","patientname":"Rahul","patientmobile":"9586582649","patientemail":"rahul.vnurture@gmail.com","placename":"Test","address":"Test","placemobile":"9820198201","landline":"12345678","placeemail":"test@xyz.com","appointmentdatetime":"10-May-18 4:30:00 PM","reason":"hello","followup":"Y","CASEID":"3"},{"appointmentID":"1","patientname":"Rahul","patientmobile":"9586582649","patientemail":"rahul.vnurture@gmail.com","placename":"Test","address":"Test","placemobile":"9820198201","landline":"12345678","placeemail":"test@xyz.com","appointmentdatetime":"10-May-18 4:30:00 PM","reason":"hello","followup":"Y","CASEID":"5"},{"appointmentID":"1","patientname":"Rahul","patientmobile":"9586582649","patientemail":"rahul.vnurture@gmail.com","placename":"Test","address":"Test","placemobile":"9820198201","landline":"12345678","placeemail":"test@xyz.com","appointmentdatetime":"10-May-18 4:30:00 PM","reason":"hello","followup":"Y","CASEID":"1"}]

class AppointmentListResponseVO {
  AppointmentListResponseVO({
      String? success, 
      String? message, 
      List<Invoices>? invoices,}){
    _success = success;
    _message = message;
    _invoices = invoices;
}

  AppointmentListResponseVO.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['invoices'] != null) {
      _invoices = [];
      json['invoices'].forEach((v) {
        _invoices?.add(Invoices.fromJson(v));
      });
    }
  }
  String? _success;
  String? _message;
  List<Invoices>? _invoices;

  String? get success => _success;
  String? get message => _message;
  List<Invoices>? get invoices => _invoices;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_invoices != null) {
      map['invoices'] = _invoices?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// appointmentID : "1"
/// patientname : "Rahul"
/// patientmobile : "9586582649"
/// patientemail : "rahul.vnurture@gmail.com"
/// placename : "Test"
/// address : "Test"
/// placemobile : "9820198201"
/// landline : "12345678"
/// placeemail : "test@xyz.com"
/// appointmentdatetime : "10-May-18 4:30:00 PM"
/// reason : "hello"
/// followup : "Y"
/// CASEID : "3"

class Invoices {
  Invoices({
      String? appointmentID, 
      String? patientname, 
      String? patientmobile, 
      String? patientemail, 
      String? placename, 
      String? address, 
      String? placemobile, 
      String? landline, 
      String? placeemail, 
      String? appointmentdatetime, 
      String? reason, 
      String? followup, 
      String? caseid,}){
    _appointmentID = appointmentID;
    _patientname = patientname;
    _patientmobile = patientmobile;
    _patientemail = patientemail;
    _placename = placename;
    _address = address;
    _placemobile = placemobile;
    _landline = landline;
    _placeemail = placeemail;
    _appointmentdatetime = appointmentdatetime;
    _reason = reason;
    _followup = followup;
    _caseid = caseid;
}

  Invoices.fromJson(dynamic json) {
    _appointmentID = json['appointmentID'];
    _patientname = json['patientname'];
    _patientmobile = json['patientmobile'];
    _patientemail = json['patientemail'];
    _placename = json['placename'];
    _address = json['address'];
    _placemobile = json['placemobile'];
    _landline = json['landline'];
    _placeemail = json['placeemail'];
    _appointmentdatetime = json['appointmentdatetime'];
    _reason = json['reason'];
    _followup = json['followup'];
    _caseid = json['CASEID'];
  }
  String? _appointmentID;
  String? _patientname;
  String? _patientmobile;
  String? _patientemail;
  String? _placename;
  String? _address;
  String? _placemobile;
  String? _landline;
  String? _placeemail;
  String? _appointmentdatetime;
  String? _reason;
  String? _followup;
  String? _caseid;

  String? get appointmentID => _appointmentID;
  String? get patientname => _patientname;
  String? get patientmobile => _patientmobile;
  String? get patientemail => _patientemail;
  String? get placename => _placename;
  String? get address => _address;
  String? get placemobile => _placemobile;
  String? get landline => _landline;
  String? get placeemail => _placeemail;
  String? get appointmentdatetime => _appointmentdatetime;
  String? get reason => _reason;
  String? get followup => _followup;
  String? get caseid => _caseid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointmentID'] = _appointmentID;
    map['patientname'] = _patientname;
    map['patientmobile'] = _patientmobile;
    map['patientemail'] = _patientemail;
    map['placename'] = _placename;
    map['address'] = _address;
    map['placemobile'] = _placemobile;
    map['landline'] = _landline;
    map['placeemail'] = _placeemail;
    map['appointmentdatetime'] = _appointmentdatetime;
    map['reason'] = _reason;
    map['followup'] = _followup;
    map['CASEID'] = _caseid;
    return map;
  }

}
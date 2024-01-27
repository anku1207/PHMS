/// case : {"caseID":"64"}

class CaseDetailsRequestVO {
  CaseDetailsRequestVO({
      Case? cases,}){
    _case = cases;
}

  CaseDetailsRequestVO.fromJson(dynamic json) {
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

/// caseID : "64"

class Case {
  Case({
      String? caseID,}){
    _caseID = caseID;
}

  Case.fromJson(dynamic json) {
    _caseID = json['caseID'];
  }
  String? _caseID;

  String? get caseID => _caseID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['caseID'] = _caseID;
    return map;
  }

}
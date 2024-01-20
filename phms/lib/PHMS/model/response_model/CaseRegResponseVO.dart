/// success : "1"
/// message : "Case Registered Successfully"
/// data : [{"caseID":"4"}]

class CaseRegResponseVO {
  CaseRegResponseVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CaseRegResponseVO.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _success;
  String? _message;
  List<Data>? _data;

  String? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// caseID : "4"

class Data {
  Data({
      String? caseID,}){
    _caseID = caseID;
}

  Data.fromJson(dynamic json) {
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
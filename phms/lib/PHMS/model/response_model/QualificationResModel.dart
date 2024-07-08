/// success : "1"
/// message : "Qualifications(s) Found"
/// data : [{"qualification":"MBBS"},{"qualification":"MD"}]

class QualificationResModel {
  QualificationResModel({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  QualificationResModel.fromJson(dynamic json) {
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

/// qualification : "MBBS"

class Data {
  Data({
      String? qualification,}){
    _qualification = qualification;
}

  Data.fromJson(dynamic json) {
    _qualification = json['qualification'];
  }
  String? _qualification;

  String? get qualification => _qualification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['qualification'] = _qualification;
    return map;
  }

}
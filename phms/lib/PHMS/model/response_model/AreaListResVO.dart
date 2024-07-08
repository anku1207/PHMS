/// success : "1"
/// message : "Location Found"
/// data : [{"AREAID":" 154796"},{" AREANAME":"(Gandhinagar) Sector 16 ","PINCODE":" 382016"},{"AREAID":" 154797"},{" AREANAME":"(Gandhinagar) Sector 17 ","PINCODE":" 382016"}]

class AreaListResVO {
  AreaListResVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  AreaListResVO.fromJson(dynamic json) {
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

/// AREAID : " 154796"

class Data {
  Data({
      String? areaid,}){
    _areaid = areaid;
}

  Data.fromJson(dynamic json) {
    _areaid = json['AREAID'];
  }
  String? _areaid;

  String? get areaid => _areaid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AREAID'] = _areaid;
    return map;
  }

}
import 'package:flutter/cupertino.dart';

/// id : "Int"
/// image : "Drawable"
/// name : "String"
/// count : "String"

class DashboardItemVO {
  int? _id;
  String? _image;
  String? _name;
  String? _count;

  int? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get count => _count;

  DashboardItemVO({int? id, String? image, String? name, String? count}) {
    _id = id;
    _image = image;
    _name = name;
    _count = count;
  }

  DashboardItemVO.fromJson(dynamic json) {
    _id = json["id"];
    _image = json["image"];
    _name = json["name"];
    _count = json["count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["image"] = _image;
    map["name"] = _name;
    map["count"] = _count;
    return map..removeWhere((key, value) => value == null);
    ;
  }
}

const int Profile = 1;
const int Patient_Registration = 2;
const int New_Case = 3;
const int Patient_History = 4;
const int View_Appointment = 5;
const int Document_Images = 6;
const int Refer_A_Doctor = 7;
const int Advanced_Search = 8;
const int History = 9;
const int Report = 10;
const int Medical_Bill = 11;
const int Medical_Scheduler = 12;




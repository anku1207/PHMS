/// success : "1"
/// message : "Location Found"
/// data : [{"AREAID":" 154796"},{" AREANAME":"(Gandhinagar) Sector 16 ","PINCODE":" 382016"},{"AREAID":" 154797"},{" AREANAME":"(Gandhinagar) Sector 17 ","PINCODE":" 382016"}]

class AreaListResVO {
  String? success;
  String? message;
  List<Data>? data;

  AreaListResVO({this.success, this.message, this.data});

  AreaListResVO.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? pincode;
  List<AreaName>? areaName;

  Data({this.pincode, this.areaName});

  Data.fromJson(Map<String, dynamic> json) {
    pincode = json['pincode'];
    if (json['areaName'] != null) {
      areaName = <AreaName>[];
      json['areaName'].forEach((v) {
        areaName!.add(new AreaName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pincode'] = this.pincode;
    if (this.areaName != null) {
      data['areaName'] = this.areaName!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaName {
  int? aID;
  String? aName;

  AreaName({this.aID, this.aName});

  AreaName.fromJson(Map<String, dynamic> json) {
    aID = json['aID'];
    aName = json['aName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aID'] = this.aID;
    data['aName'] = this.aName;
    return data;
  }
}
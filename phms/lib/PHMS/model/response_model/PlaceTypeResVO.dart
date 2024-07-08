/// success : "1"
/// message : "Place Type Found"
/// data : [{"PLACETYPEID":" 1"},{"PLACETYPE":"Hospital"},{"PLACETYPEID":" 2"},{"PLACETYPE":"Clinic"}]

class PlaceTypeResVO {
  String? success;
  String? message;
  List<Invoices>? invoices;

  PlaceTypeResVO({this.success, this.message, this.invoices});

  PlaceTypeResVO.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['invoices'] != null) {
      invoices = <Invoices>[];
      json['invoices'].forEach((v) {
        invoices!.add(new Invoices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.invoices != null) {
      data['invoices'] = this.invoices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Invoices {
  String? areaID;
  String? areaname;

  Invoices({this.areaID, this.areaname});

  Invoices.fromJson(Map<String, dynamic> json) {
    areaID = json['areaID'];
    areaname = json['areaname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['areaID'] = this.areaID;
    data['areaname'] = this.areaname;
    return data;
  }
}
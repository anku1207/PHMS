/// success : "1"
/// message : "Doctor Registered Successfully"
/// DOCTORID : "1"

class DoctorRegisterResVO {
  String? success;
  String? message;
  String? doctorID;

  DoctorRegisterResVO({this.success, this.message, this.doctorID});

  DoctorRegisterResVO.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    doctorID = json['DoctorID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['DoctorID'] = this.doctorID;
    return data;
  }
}
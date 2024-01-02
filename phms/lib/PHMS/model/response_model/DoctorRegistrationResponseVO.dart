/// success : "0"
/// message : "Patient Registration Failed. Please try after sometime."

class DoctorRegistrationResponseVO {
  DoctorRegistrationResponseVO({
      String? success, 
      String? message,}){
    _success = success;
    _message = message;
}

  DoctorRegistrationResponseVO.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
  }
  String? _success;
  String? _message;

  String? get success => _success;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }

}
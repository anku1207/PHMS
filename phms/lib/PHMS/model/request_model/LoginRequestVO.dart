/// login : {"logintype":"P","username":"test","password":"ABC1979"}

class LoginRequestVO {
  LoginRequestVO({
      Login? login,}){
    _login = login;
}

  LoginRequestVO.fromJson(dynamic json) {
    _login = json['login'] != null ? Login.fromJson(json['login']) : null;
  }
  Login? _login;

  Login? get login => _login;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_login != null) {
      map['login'] = _login?.toJson();
    }
    return map;
  }

}

/// logintype : "P"
/// username : "test"
/// password : "ABC1979"

class Login {
  Login({
      String? logintype, 
      String? username, 
      String? password,}){
    _logintype = logintype;
    _username = username;
    _password = password;
}

  Login.fromJson(dynamic json) {
    _logintype = json['logintype'];
    _username = json['username'];
    _password = json['password'];
  }
  String? _logintype;
  String? _username;
  String? _password;

  String? get logintype => _logintype;
  String? get username => _username;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['logintype'] = _logintype;
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }

}
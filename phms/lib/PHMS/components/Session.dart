import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

Future<String?> checkCustomerSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(LOGIN_DATA);
}

Future<String?> getUserTypeLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(USER_LOGIN_TYPE);
}
Future<String?> getAuthorizationToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? tokenType = prefs.getString(KEY_TOKEN_TYPE);
  String? accessToken = prefs.getString(KEY_ACCESS_TOKEN);

  String? authToken = (tokenType ?? '') + ' ' + (accessToken ?? '');
  return authToken;
}
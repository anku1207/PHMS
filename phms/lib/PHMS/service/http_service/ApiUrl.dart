import 'package:phms/PHMS/components/Session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiUrl {
// const val BASE_URL = "http://192.168.3.121:8986/api/" // base url
//const val BASE_URL = "http://192.168.1.7:8001/api/" // base url
//const val BASE_URL = "http://192.168.43.185:8001/api/" // base url
//static const BASE_URL = "http://cbsl_connect.cbslgroup.in/api/"; // base url
  static const BASE_URL = "http://dev.connect.phmspro.com/";
  static const IMAGE_BASE_URL = "https://componentsandlights.com";
}

Future<Map<String, String>> getApiHeaders() async {
  String? authToken = await getAuthorizationToken();

  // Define the headers with the 'Authorization' token
  Map<String, String> headers = {
    'apiconnection': 'appmobile',
    'Authorization': authToken ?? '', // Use an empty string if authToken is null
  };

  return headers;
}


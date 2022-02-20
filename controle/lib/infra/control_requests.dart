import 'dart:convert';

import 'package:http/http.dart' as http;

class ControlRequests {
  ControlRequests();

  Future sendComand(String route, Map? body) {
    String baseUrl = "http://192.168.5.192:8000";
    if (body == null) {
      return http.post(Uri.parse('${baseUrl}/${route}'));
    } else {
      return http.post(Uri.parse('${baseUrl}/${route}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class ControlRequests {
  ControlRequests();

  void sendComand(String route, Map? body) {
    String baseUrl = "http://192.168.2.26:8000";
    if (body == null) {
      http.post(Uri.parse('${baseUrl}/${route}'));
    } else {
      http.post(Uri.parse('${baseUrl}/${route}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
    }
  }
}

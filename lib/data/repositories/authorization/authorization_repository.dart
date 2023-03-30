import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthorizationRepository {
  final url = 'http://143.198.174.245/Auth/login';

  Future<int> postAuthorizationReq(String username, String password) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode({'username': username, 'password': password}),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          });
      return response.statusCode;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

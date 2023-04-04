import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RenewTokenRepository {
  final _url = 'http://143.198.174.245/Auth/renew-token';

  Future<bool> renewToken() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');
      final refreshToken = sharedPreferences.getString('refreshToken');

      final response = await http.post(
        Uri.parse(_url),
        headers: {
          'Accept': 'application/json',
          'content-type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({'token': refreshToken}),
      );

      return response.statusCode == 200;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

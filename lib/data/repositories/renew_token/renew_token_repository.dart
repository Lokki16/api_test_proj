import 'dart:convert';
import 'package:api_test_proj/data/models/user/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RenewTokenRepository {
  final _url = 'http://143.198.174.245/Auth/renew-token';

  Future<bool> renewToken() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');
      final token = sharedPreferences.getString('refreshToken');

      final response = await http.post(
        Uri.parse(_url),
        headers: {
          'Accept': 'application/json',
          'content-type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({'token': token}),
      );

      final refreshToken =
          UserModel.fromJson(json.decode(response.body)).refreshToken;
      sharedPreferences.setString('refreshToken', refreshToken);

      return response.statusCode == 200;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

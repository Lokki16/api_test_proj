import 'dart:convert';
import 'package:api_test_proj/data/models/user/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationRepository {
  final url = 'http://143.198.174.245/Auth/login';

  Future<bool> postAuthorization(String username, String password) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode({'username': username, 'password': password}),
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
          });

      if (response.statusCode == 200) {
        final accessToken =
            UserModel.fromJson(json.decode(response.body)).accessToken;
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('accessToken', accessToken);
      }

      return response.statusCode == 200;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

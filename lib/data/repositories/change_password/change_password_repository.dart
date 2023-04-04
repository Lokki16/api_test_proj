import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordRepository {
  final url = 'http://143.198.174.245/Auth/changePassword';

  Future<bool> changePassword(
    String currentPassword,
    String newPassword,
    String passwordConfirm,
  ) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'content-type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'passwordConfirm': passwordConfirm,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

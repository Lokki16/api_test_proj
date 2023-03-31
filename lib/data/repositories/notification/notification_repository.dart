import 'dart:convert';
import 'package:api_test_proj/data/models/notification/notification_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotificationRepository {
  final url = 'http://143.198.174.245/api/User/getNotificationsList';

  Future<ListNotificationModel> getNotifications() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');

      final response = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });
      return ListNotificationModel.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:api_test_proj/data/models/notification/notification_model.dart';

class NotificationRepository {
  final _url = 'http://143.198.174.245/api/User/getNotificationsList';

  Future<ListNotificationModel> getNotifications() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final accessToken = sharedPreferences.getString('accessToken');

      final response = await http.get(Uri.parse(_url), headers: {
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

import 'dart:convert';
import 'package:api_test_proj/data/models/user/notification_model.dart';
import 'package:http/http.dart' as http;

class NotificationRepository {
  final url = 'http://143.198.174.245/api/User/getNotificationsList';
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiQXJtYW4iLCJleHAiOjE2ODAzNDA4OTYsImlzcyI6ImxvY2FsaG9zdDo1MTk3IiwiYXVkIjoiQVBJIn0.XLQ48Ya-BLBKOYpK3iDt9PlOMhLuX4JhQQYEGqLRiDM';

  Future<ListNotificationModel> getNotifications() async {
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return ListNotificationModel.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(anyMap: true)
class ListNotificationModel {
  final List<NotificationModel> data;

  @override
  const ListNotificationModel({required this.data});

  factory ListNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListNotificationModelToJson(this);
}

@JsonSerializable(anyMap: true)
class NotificationModel {
  final String title;
  final String body;
  final String dateTime;

  @override
  const NotificationModel({
    required this.title,
    required this.body,
    required this.dateTime,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNotificationModel _$ListNotificationModelFromJson(Map json) =>
    ListNotificationModel(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              NotificationModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$ListNotificationModelToJson(
        ListNotificationModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

NotificationModel _$NotificationModelFromJson(Map json) => NotificationModel(
      title: json['title'] as String,
      body: json['body'] as String,
      dateTime: json['dateTime'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'dateTime': instance.dateTime,
    };

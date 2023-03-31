part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitialState extends NotificationState {}

class NotificationLoadedState extends NotificationState {
  final ListNotificationModel notificationLoaded;

  NotificationLoadedState({required this.notificationLoaded});
}

class NotificationErrorState extends NotificationState {}

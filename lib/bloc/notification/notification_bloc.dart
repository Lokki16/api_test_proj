import 'package:api_test_proj/data/models/user/notification_model.dart';
import 'package:api_test_proj/data/repositories/notification/notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitialState()) {
    on<NotificationFetchEvent>(_notificationFetchEvent);
  }

  void _notificationFetchEvent(
      NotificationFetchEvent event, Emitter<NotificationState> emit) async {
    emit(NotificationInitialState());

    try {
      final notificationRepository = NotificationRepository();
      ListNotificationModel notificationLoaded =
          await notificationRepository.getNotifications();
      emit(NotificationLoadedState(notificationLoaded: notificationLoaded));
    } catch (e) {
      emit(NotificationErrorState());
    }
  }
}

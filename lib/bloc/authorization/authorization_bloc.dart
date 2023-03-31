import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  String username;
  String password;

  AuthorizationBloc({this.username = '', this.password = ''})
      : super(AuthorizationInitialState()) {
    on<AuthorizationFetchEvent>(_fetchEvent);
    on<AuthorizationUsernameChangeEvent>(_usernameChangeEvent);
    on<AuthorizationPasswordChangeEvent>(_passwordChangeEvent);
  }

  void _fetchEvent(
      AuthorizationFetchEvent event, Emitter<AuthorizationState> emit) async {
    emit(AuthorizationInitialState());

    try {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(AuthorizationLoadedState());
    } catch (e) {
      emit(AuthorizationErrorState());
    }
  }

  void _usernameChangeEvent(AuthorizationUsernameChangeEvent event,
      Emitter<AuthorizationState> emit) async {
    username = event.username;
    emit(AuthorizationLoadedState(username: username, password: password));
  }

  void _passwordChangeEvent(AuthorizationPasswordChangeEvent event,
      Emitter<AuthorizationState> emit) async {
    password = event.password;
    emit(AuthorizationLoadedState(username: username, password: password));
  }
}

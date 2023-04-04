import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  String username;
  String password;
  bool isObscurePassword;

  AuthorizationBloc({
    this.username = '',
    this.password = '',
    this.isObscurePassword = true,
  }) : super(AuthorizationInitialState()) {
    on<AuthorizationFetchEvent>(_fetchEvent);
    on<AuthorizationUsernameEvent>(_usernameEvent);
    on<AuthorizationPasswordEvent>(_passwordEvent);
    on<AuthorizationObsecurePasswordEvent>(_obscurePasswordEvent);
  }

  void _fetchEvent(
    AuthorizationFetchEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    emit(AuthorizationInitialState());

    try {
      emit(AuthorizationLoadedState());
    } catch (e) {
      emit(AuthorizationErrorState());
    }
  }

  void _usernameEvent(
    AuthorizationUsernameEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    username = event.username;

    emit(AuthorizationLoadedState(
      username: username,
      password: password,
      isObscurePassword: isObscurePassword,
    ));
  }

  void _passwordEvent(
    AuthorizationPasswordEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    password = event.password;

    emit(AuthorizationLoadedState(
      username: username,
      password: password,
      isObscurePassword: isObscurePassword,
    ));
  }

  void _obscurePasswordEvent(
    AuthorizationObsecurePasswordEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    isObscurePassword = event.isObscurePassword;

    emit(AuthorizationLoadedState(
      username: username,
      password: password,
      isObscurePassword: isObscurePassword,
    ));
  }
}

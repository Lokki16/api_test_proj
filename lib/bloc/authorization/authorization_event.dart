part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationEvent {}

class AuthorizationFetchEvent extends AuthorizationEvent {}

class AuthorizationUsernameEvent extends AuthorizationEvent {
  final String username;

  AuthorizationUsernameEvent(this.username);
}

class AuthorizationPasswordEvent extends AuthorizationEvent {
  final String password;

  AuthorizationPasswordEvent(this.password);
}

class AuthorizationObsecurePasswordEvent extends AuthorizationEvent {
  final bool isObscurePassword;

  AuthorizationObsecurePasswordEvent(this.isObscurePassword);
}

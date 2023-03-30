part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationEvent {}

class AuthorizationFetchEvent extends AuthorizationEvent {}

class AuthorizationUsernameChangeEvent extends AuthorizationEvent {
  final String username;

  AuthorizationUsernameChangeEvent(this.username);
}

class AuthorizationPasswordChangeEvent extends AuthorizationEvent {
  final String password;

  AuthorizationPasswordChangeEvent(this.password);
}

class AuthorizationSubmittedEvent extends AuthorizationEvent {
  final String username;
  final String password;

  AuthorizationSubmittedEvent(this.username, this.password);
}

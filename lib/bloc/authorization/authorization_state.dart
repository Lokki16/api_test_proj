part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationState {}

class AuthorizationInitialState extends AuthorizationState {}

class AuthorizationErrorState extends AuthorizationState {}

class AuthorizationLoadedState extends AuthorizationState {
  final String username;
  final String password;

  AuthorizationLoadedState({this.username = '', this.password = ''});
}

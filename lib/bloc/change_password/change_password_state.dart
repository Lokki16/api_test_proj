part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordErrorState extends ChangePasswordState {}

class ChangePasswordLoadedState extends ChangePasswordState {
  final String currentPassword;
  final String newPassword;
  final String passwordConfirm;

  ChangePasswordLoadedState({
    this.currentPassword = '',
    this.newPassword = '',
    this.passwordConfirm = '',
  });
}

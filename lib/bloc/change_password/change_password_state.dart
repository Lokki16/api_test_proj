part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordChangeState extends ChangePasswordState {
  final String? currentPassword;
  final String? newPassword;
  final String? passwordConfirm;

  ChangePasswordChangeState({
    this.currentPassword,
    this.newPassword,
    this.passwordConfirm,
  });
}

class ChangePasswordErrorState extends ChangePasswordState {}

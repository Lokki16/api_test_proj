part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordErrorState extends ChangePasswordState {}

class ChangePasswordLoadedState extends ChangePasswordState {
  final String currentPassword;
  final String newPassword;
  final String passwordConfirm;
  final bool isObscureCurrentPassword;
  final bool isObscureNewPassword;
  final bool isObscurePasswordConfirm;

  ChangePasswordLoadedState({
    this.currentPassword = '',
    this.newPassword = '',
    this.passwordConfirm = '',
    this.isObscureCurrentPassword = true,
    this.isObscureNewPassword = true,
    this.isObscurePasswordConfirm = true,
  });
}

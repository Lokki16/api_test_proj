part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent {}

class ChangePasswordFetchEvent extends ChangePasswordEvent {}

class ChangeCurrentPasswordEvent extends ChangePasswordEvent {
  final String currentPassword;

  ChangeCurrentPasswordEvent({required this.currentPassword});
}

class ChangeNewPasswordEvent extends ChangePasswordEvent {
  final String newPassword;

  ChangeNewPasswordEvent({required this.newPassword});
}

class ChangePasswordConfirmEvent extends ChangePasswordEvent {
  final String passwordConfirm;

  ChangePasswordConfirmEvent({required this.passwordConfirm});
}

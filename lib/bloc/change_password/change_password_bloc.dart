import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  String currentPassword;
  String newPassword;
  String passwordConfirm;

  ChangePasswordBloc({
    this.currentPassword = '',
    this.newPassword = '',
    this.passwordConfirm = '',
  }) : super(ChangePasswordInitialState()) {
    on<ChangePasswordFetchEvent>(_fetchEvent);
    on<ChangeCurrentPasswordEvent>(_changeCurrentPasswordEvent);
    on<ChangeNewPasswordEvent>(_changeNewPasswordEvent);
    on<ChangePasswordConfirmEvent>(_changePasswordConfirmEvent);
  }

  void _fetchEvent(
    ChangePasswordFetchEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(ChangePasswordInitialState());

    try {
      emit(ChangePasswordChangeState());
    } catch (e) {
      emit(ChangePasswordErrorState());
    }
  }

  void _changeCurrentPasswordEvent(
    ChangeCurrentPasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) {
    currentPassword = event.currentPassword;

    emit(ChangePasswordChangeState(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
    ));
  }

  void _changeNewPasswordEvent(
    ChangeNewPasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) {
    newPassword = event.newPassword;

    emit(ChangePasswordChangeState(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
    ));
  }

  void _changePasswordConfirmEvent(
    ChangePasswordConfirmEvent event,
    Emitter<ChangePasswordState> emit,
  ) {
    passwordConfirm = event.passwordConfirm;

    emit(ChangePasswordChangeState(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
    ));
  }
}

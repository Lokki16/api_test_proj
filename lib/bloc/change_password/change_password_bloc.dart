import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  String currentPassword;
  String newPassword;
  String passwordConfirm;
  bool isObscureCurrentPassword;
  bool isObscureNewPassword;
  bool isObscurePasswordConfirm;

  ChangePasswordBloc({
    this.currentPassword = '',
    this.newPassword = '',
    this.passwordConfirm = '',
    this.isObscureCurrentPassword = true,
    this.isObscureNewPassword = true,
    this.isObscurePasswordConfirm = true,
  }) : super(ChangePasswordInitialState()) {
    on<ChangePasswordFetchEvent>(_fetchEvent);
    on<ChangeCurrentPasswordEvent>(_changeCurrentPasswordEvent);
    on<ChangeNewPasswordEvent>(_changeNewPasswordEvent);
    on<ChangePasswordConfirmEvent>(_changePasswordConfirmEvent);
    on<ObscureCurrentPasswordEvent>(_obscureCurrentPasswordEvent);
    on<ObscureNewPasswordEvent>(_obscureNewPasswordEvent);
    on<ObscurePasswordConfirmEvent>(_obscurePasswordConfirmEvent);
  }

  void _fetchEvent(
    ChangePasswordFetchEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(ChangePasswordInitialState());

    try {
      emit(ChangePasswordLoadedState());
    } catch (e) {
      emit(ChangePasswordErrorState());
    }
  }

  void _changeCurrentPasswordEvent(
    ChangeCurrentPasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) {
    currentPassword = event.currentPassword;

    emit(ChangePasswordLoadedState(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
      isObscureCurrentPassword: isObscureCurrentPassword,
      isObscureNewPassword: isObscureNewPassword,
      isObscurePasswordConfirm: isObscurePasswordConfirm,
    ));
  }

  void _changeNewPasswordEvent(
    ChangeNewPasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) {
    newPassword = event.newPassword;

    emit(ChangePasswordLoadedState(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
      isObscureCurrentPassword: isObscureCurrentPassword,
      isObscureNewPassword: isObscureNewPassword,
      isObscurePasswordConfirm: isObscurePasswordConfirm,
    ));
  }

  void _changePasswordConfirmEvent(
    ChangePasswordConfirmEvent event,
    Emitter<ChangePasswordState> emit,
  ) {
    passwordConfirm = event.passwordConfirm;

    emit(ChangePasswordLoadedState(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
      isObscureCurrentPassword: isObscureCurrentPassword,
      isObscureNewPassword: isObscureNewPassword,
      isObscurePasswordConfirm: isObscurePasswordConfirm,
    ));
  }

  void _obscureCurrentPasswordEvent(
    ObscureCurrentPasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    isObscureCurrentPassword = event.isObscureCurrentPassword;

    emit(ChangePasswordLoadedState(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
      isObscureCurrentPassword: isObscureCurrentPassword,
      isObscureNewPassword: isObscureNewPassword,
      isObscurePasswordConfirm: isObscurePasswordConfirm,
    ));
  }

  void _obscureNewPasswordEvent(
    ObscureNewPasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    isObscureNewPassword = event.isObscureNewPassword;

    emit(ChangePasswordLoadedState(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
      isObscureCurrentPassword: isObscureCurrentPassword,
      isObscureNewPassword: isObscureNewPassword,
      isObscurePasswordConfirm: isObscurePasswordConfirm,
    ));
  }

  void _obscurePasswordConfirmEvent(
    ObscurePasswordConfirmEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    isObscurePasswordConfirm = event.isObscurePasswordConfirm;

    emit(ChangePasswordLoadedState(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
      isObscureCurrentPassword: isObscureCurrentPassword,
      isObscureNewPassword: isObscureNewPassword,
      isObscurePasswordConfirm: isObscurePasswordConfirm,
    ));
  }
}

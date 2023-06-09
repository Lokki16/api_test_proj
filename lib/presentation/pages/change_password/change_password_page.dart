import 'package:api_test_proj/presentation/template/template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        builder: (context, state) {
          if (state is ChangePasswordInitialState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ChangePasswordErrorState) {
            return const Center(child: Text('Error!'));
          }

          if (state is ChangePasswordLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  label: 'Current password',
                  obscureText: state.isObscureCurrentPassword,
                  suffixIcon: Icons.remove_red_eye_outlined,
                  suffixOnPressed: () => context.read<ChangePasswordBloc>().add(
                      ObscureCurrentPasswordEvent(
                          !state.isObscureCurrentPassword)),
                  onChanged: (currentPassword) => context
                      .read<ChangePasswordBloc>()
                      .add(ChangeCurrentPasswordEvent(
                          currentPassword: currentPassword)),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: 'New password',
                  obscureText: state.isObscureNewPassword,
                  suffixIcon: Icons.remove_red_eye_outlined,
                  suffixOnPressed: () => context.read<ChangePasswordBloc>().add(
                      ObscureNewPasswordEvent(!state.isObscureNewPassword)),
                  onChanged: (newPassword) => context
                      .read<ChangePasswordBloc>()
                      .add(ChangeNewPasswordEvent(newPassword: newPassword)),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: 'Password confirm',
                  obscureText: state.isObscurePasswordConfirm,
                  suffixIcon: Icons.remove_red_eye_outlined,
                  suffixOnPressed: () => context.read<ChangePasswordBloc>().add(
                      ObscurePasswordConfirmEvent(
                          !state.isObscurePasswordConfirm)),
                  onChanged: (passwordConfirm) => context
                      .read<ChangePasswordBloc>()
                      .add(ChangePasswordConfirmEvent(
                          passwordConfirm: passwordConfirm)),
                ),
                SizedBox(height: 50.h),
                CustomButton(
                  width: double.infinity,
                  text: 'Change password',
                  onPressed: () async {
                    final status =
                        await ChangePasswordRepository().changePassword(
                      state.currentPassword,
                      state.newPassword,
                      state.passwordConfirm,
                    );

                    status
                        ? Get.toNamed(AppRoutes.routeToHomePage)
                        : showSimpleDialog(title: 'Error!');
                  },
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

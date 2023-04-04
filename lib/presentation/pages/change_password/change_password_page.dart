import 'package:api_test_proj/bloc/change_password/change_password_bloc.dart';
import 'package:api_test_proj/data/navigation/routes.dart';
import 'package:api_test_proj/data/repositories/change_password/change_password_repository.dart';
import 'package:api_test_proj/presentation/widgets/custom_button.dart';
import 'package:api_test_proj/presentation/widgets/custom_popup.dart';
import 'package:api_test_proj/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
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
                      onChanged: (currentPassword) => context
                          .read<ChangePasswordBloc>()
                          .add(ChangeCurrentPasswordEvent(
                              currentPassword: currentPassword)),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: 'New password',
                      onChanged: (newPassword) => context
                          .read<ChangePasswordBloc>()
                          .add(
                              ChangeNewPasswordEvent(newPassword: newPassword)),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: 'Password confirm',
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
        ),
      ),
    );
  }
}

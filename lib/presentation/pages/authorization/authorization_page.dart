import 'package:api_test_proj/bloc/authorization/authorization_bloc.dart';
import 'package:api_test_proj/data/navigation/routes.dart';
import 'package:api_test_proj/data/repositories/authorization/authorization_repository.dart';
import 'package:api_test_proj/presentation/layout/default_body.dart';
import 'package:api_test_proj/presentation/widgets/custom_button.dart';
import 'package:api_test_proj/presentation/widgets/custom_popup.dart';
import 'package:api_test_proj/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
        builder: (context, state) {
          if (state is AuthorizationInitialState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AuthorizationErrorState) {
            return const Center(child: Text('Error!'));
          }

          if (state is AuthorizationLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  label: 'Login',
                  onChanged: (username) => context
                      .read<AuthorizationBloc>()
                      .add(AuthorizationUsernameEvent(username)),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: 'Password',
                  obscureText: state.isObscurePassword,
                  suffixIcon: Icons.remove_red_eye_outlined,
                  suffixOnPressed: () => context.read<AuthorizationBloc>().add(
                      AuthorizationObsecurePasswordEvent(
                          !state.isObscurePassword)),
                  onChanged: (password) => context
                      .read<AuthorizationBloc>()
                      .add(AuthorizationPasswordEvent(password)),
                ),
                SizedBox(height: 50.h),
                CustomButton(
                  width: double.infinity,
                  text: 'Login',
                  onPressed: () async {
                    final status = await AuthorizationRepository()
                        .postAuthorization(state.username, state.password);

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

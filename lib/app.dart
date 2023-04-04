import 'package:api_test_proj/bloc/authorization/authorization_bloc.dart';
import 'package:api_test_proj/bloc/change_password/change_password_bloc.dart';
import 'package:api_test_proj/bloc/notification/notification_bloc.dart';
import 'package:api_test_proj/data/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AuthorizationBloc()..add(AuthorizationFetchEvent())),
        BlocProvider(
            create: (context) =>
                ChangePasswordBloc()..add(ChangePasswordFetchEvent())),
        BlocProvider(
            create: (context) =>
                NotificationBloc()..add(NotificationFetchEvent())),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
          title: 'Test',
          navigatorKey: Get.key,
          routes: AppRoutes.getRoutes,
          initialRoute: AppRoutes.routeToAuthorizationPage,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

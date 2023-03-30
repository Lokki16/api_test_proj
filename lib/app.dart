import 'package:api_test_proj/bloc/authorization/authorization_bloc.dart';
import 'package:api_test_proj/presentation/pages/authorization_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        title: 'Test',
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) =>
              AuthorizationBloc()..add(AuthorizationFetchEvent()),
          child: const AuthorizationPage(),
        ),
      ),
    );
  }
}

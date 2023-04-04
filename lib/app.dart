import 'package:api_test_proj/presentation/template/template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool status = false;

  @override
  Widget build(BuildContext context) {
    getStatus();

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
          builder: (context, child) => MaterialApp(
                title: 'Test',
                navigatorKey: Get.key,
                routes: AppRoutes.getRoutes,
                initialRoute: status
                    ? AppRoutes.routeToHomePage
                    : AppRoutes.routeToAuthorizationPage,
                debugShowCheckedModeBanner: false,
              )),
    );
  }

  void getStatus() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('refreshToken');
    status = await RenewTokenRepository().renewToken(token);
  }
}

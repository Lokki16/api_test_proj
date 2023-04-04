import 'package:api_test_proj/presentation/template/template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

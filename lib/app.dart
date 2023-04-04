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
                InitialRouteBloc()..add(InitialRouteFetchEvent())),
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
      child: ScreenUtilInit(builder: (context, child) {
        final isAuthorized = context.read<InitialRouteBloc>().isAuthorized;

        return MaterialApp(
          title: 'Test',
          navigatorKey: Get.key,
          routes: AppRoutes.getRoutes,
          initialRoute: isAuthorized
              ? AppRoutes.routeToHomePage
              : AppRoutes.routeToAuthorizationPage,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

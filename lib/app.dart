import 'package:api_test_proj/presentation/template/template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Test',
          navigatorKey: Get.key,
          routes: AppRoutes.getRoutes,
          home: Scaffold(
            body: BlocBuilder<InitialRouteBloc, InitialRouteState>(
              builder: (context, state) {
                if (state is InitialRouteInitialState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is InitialRouteErrorState) {
                  return const AuthorizationPage();
                }

                if (state is InitialRouteLoadedState) {
                  return state.isAuthorized
                      ? const HomePage()
                      : const AuthorizationPage();
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}

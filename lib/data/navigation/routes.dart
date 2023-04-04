import 'package:api_test_proj/presentation/template/template.dart';

class AppRoutes {
  static const String routeToAuthorizationPage = '/authorization_page';
  static const String routeToChangePasswordPage = 'change_password_page';
  static const String routeToHomePage = 'home_page';

  static dynamic getRoutes = {
    routeToAuthorizationPage: (context) => const AuthorizationPage(),
    routeToChangePasswordPage: (context) => const ChangePasswordPage(),
    routeToHomePage: (context) => const HomePage(),
  };
}

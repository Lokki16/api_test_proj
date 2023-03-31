import 'package:api_test_proj/presentation/pages/authorization/authorization_page.dart';
import 'package:api_test_proj/presentation/pages/home/home_page.dart';

class AppRoutes {
  static const String routeToAuthorizationPage = '/authorization_page';
  static const String routeToHomePage = 'home_page';

  static dynamic getRoutes = {
    routeToAuthorizationPage: (context) => const AuthorizationPage(),
    routeToHomePage: (context) => const HomePage(),
  };
}

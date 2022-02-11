import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/login/login_screen.dart';
import 'package:delivery_app/presentation/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

class DeliveryRoutes {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String home = "/home";
}

class DeliveryPages {
  static final pages = [
    GetPage(name: DeliveryRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: DeliveryRoutes.home, page: () => const HomeScreen()),
    GetPage(name: DeliveryRoutes.login, page: () => const LoginScreen()),
  ];
}

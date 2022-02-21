import 'package:delivery_app/presentation/home/home_binding.dart';
import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/login/login_binding.dart';
import 'package:delivery_app/presentation/login/login_screen.dart';
import 'package:delivery_app/presentation/main_binding.dart';
import 'package:delivery_app/presentation/splash/splash_binding.dart';
import 'package:delivery_app/presentation/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

class DeliveryRoutes {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String home = "/home";
}

class DeliveryPages {
  static final pages = [
    GetPage(
        name: DeliveryRoutes.splash,
        page: () => SplashScreen(),
        bindings: [MainBinding(), SplashBinding()]),
    GetPage(
        name: DeliveryRoutes.login,
        page: () => LoginScreen(),
        bindings: [LoginBinding(), MainBinding()]),
    GetPage(
        name: DeliveryRoutes.home,
        page: () => HomeScreen(),
        binding: HomeBinding()),
  ];
}

import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/routes/routes_delivery.dart';
import 'package:delivery_app/theme.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late final LocalRepositoryInterface localRepositoryInterface;
  late final ApiRepositoryInterface apiRepositoryInterface;

  SplashController(
      {required this.localRepositoryInterface,
      required this.apiRepositoryInterface});

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  @override
  void onInit() {
    validateTheme();
    super.onInit();
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
    } else {
      Get.offNamed(DeliveryRoutes.login);
    }
  }

  void validateTheme() async {
    final isdarkMode = await localRepositoryInterface.getDarkMode();
    if (isdarkMode != null) {
      Get.changeTheme(isdarkMode ? darkTheme : ligthTheme);
    } else {
      Get.changeTheme(Get.isDarkMode ? darkTheme : ligthTheme);
    }
  }
}

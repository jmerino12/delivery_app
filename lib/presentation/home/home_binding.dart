import 'package:delivery_app/presentation/home/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(localRepositoryInterface: Get.find()));
  }
}

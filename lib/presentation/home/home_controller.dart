import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  HomeController({required this.localRepositoryInterface});

  late Rx<User> user = User.empty().obs;

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() async {
    final currentUser = await localRepositoryInterface.getUser();
    user(currentUser);
  }
}

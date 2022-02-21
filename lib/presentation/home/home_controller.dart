import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  HomeController(
      {required this.localRepositoryInterface,
      required this.apiRepositoryInterface});

  late Rx<User> user = User.empty().obs;
  RxInt indexSelected = 0.obs;
  RxBool darkTheme = false.obs;

  @override
  void onReady() {
    loadCurrentTheme();
    loadUser();
    super.onReady();
  }

  void loadUser() async {
    final currentUser = await localRepositoryInterface.getUser();
    user(currentUser);
  }

  void updateIndexSelected(int index) {
    indexSelected(index);
  }

  Future<void> logout() async {
    final token = await localRepositoryInterface.getToken();
    apiRepositoryInterface.logout(token!);
    localRepositoryInterface.clearAllData();
  }

  void loadCurrentTheme() async {
    final isDark = await localRepositoryInterface.getDarkMode();
    darkTheme(isDark);
  }

  bool updateTheme(bool isDark) {
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }
}

import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:flutter/material.dart';

class HomeBLoC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  HomeBLoC(
      {required this.localRepositoryInterface,
      required this.apiRepositoryInterface});

  User user = User.empty();
  int indexSelected = 0;

  void loadUser() async {
    user = await localRepositoryInterface.getUser();
    notifyListeners();
  }

  void updateIndexSelected(int index) {
    indexSelected = index;
    notifyListeners();
  }

  /*Future<void> logout() async {
    final token = await localRepositoryInterface.getToken();
    apiRepositoryInterface.logout(token!);
    localRepositoryInterface.clearAllData();
  }*/

  /*bool updateTheme(bool isDark) {
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }*/
}

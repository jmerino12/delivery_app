import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:flutter/material.dart';

class SplashBLoC extends ChangeNotifier {
  late final LocalRepositoryInterface localRepositoryInterface;
  late final ApiRepositoryInterface apiRepositoryInterface;

  SplashBLoC(
      {required this.localRepositoryInterface,
      required this.apiRepositoryInterface});

  Future<bool> validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      return true;
    } else {
      return false;
    }
  }

  /*void validateTheme() async {
    final isdarkMode = await localRepositoryInterface.getDarkMode();
    if (isdarkMode != null) {
      //Get.changeTheme(isdarkMode ? darkTheme : ligthTheme);
    } else {
      //Get.changeTheme(Get.isDarkMode ? darkTheme : ligthTheme);
    }
  }*/
}

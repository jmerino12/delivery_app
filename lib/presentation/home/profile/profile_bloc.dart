import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:flutter/material.dart';

class ProfileBLoC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  bool isDark = false;

  ProfileBLoC({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  Future<void> logout() async {
    final token = await localRepositoryInterface.getToken();
    apiRepositoryInterface.logout(token!);
    localRepositoryInterface.clearAllData();
  }

  void loadTheme() async {
    isDark = await localRepositoryInterface.getDarkMode() ?? false;
    notifyListeners();
  }

  void updateTheme(bool isDarkValue) {
    localRepositoryInterface.saveDarkMode(isDark);
    isDark = isDarkValue;
    notifyListeners();
  }
}

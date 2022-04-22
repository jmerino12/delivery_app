import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';

class MainBLoC extends ChangeNotifier {
  ThemeData? currentTheme = null;
  final LocalRepositoryInterface localRepositoryInterface;

  MainBLoC({required this.localRepositoryInterface});

  void loadTheme() async {
    final isDark = await localRepositoryInterface.getDarkMode() ?? false;
    updateTheme(isDark ? darkTheme : ligthTheme);
  }

  void updateTheme(ThemeData theme) {
    currentTheme = theme;
    notifyListeners();
  }
}

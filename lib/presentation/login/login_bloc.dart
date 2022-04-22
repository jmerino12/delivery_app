import 'package:delivery_app/domain/request/login_request.dart';
import 'package:flutter/material.dart';
import '../../domain/repository/api_repository.dart';
import '../../domain/repository/local_storage_repository.dart';

enum LoginState { loading, initial }

class LoginBLoC extends ChangeNotifier {
  late final LocalRepositoryInterface localRepositoryInterface;
  late final ApiRepositoryInterface apiRepositoryInterface;

  LoginBLoC(
      {required this.localRepositoryInterface,
      required this.apiRepositoryInterface});

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.initial;

  Future<bool> login() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;
    try {
      loginState = LoginState.loading;
      notifyListeners();
      final loginResponse =
          await apiRepositoryInterface.login(LoginRequest(username, password));

      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);
      loginState = LoginState.initial;
      notifyListeners();
      return true;
    } catch (e) {
      loginState = LoginState.initial;
      notifyListeners();
      return false;
    }
  }
}

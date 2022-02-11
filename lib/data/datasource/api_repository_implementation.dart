import 'dart:math';

import 'package:delivery_app/domain/exception/auth_exception.dart';
import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/response/login_response.dart';
import 'package:delivery_app/domain/request/login_request.dart';

class ApiRespositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    //hhtp aqui se conectar a http o Firebase

    await Future.delayed(const Duration(seconds: 4));
    if (token == "AA111") {
      return const User(name: "Steve Jobs", username: "stevejobs", image: '');
    } else if (token == "AA222") {
      return const User(name: "Elon Musk", username: "elonmusk", image: '');
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    await Future.delayed(const Duration(seconds: 4));
    if (loginRequest.username == "stevejobs" &&
        loginRequest.password == 'jobs') {
      return const LoginResponse(
          "AA111", User(name: "Steve Jobs", username: "stevejobs", image: ''));
    } else if (loginRequest.username == "elonmusk") {
      return const LoginResponse(
          "AA222", User(name: "Elon Musk", username: "elonmusk", image: ''));
    }

    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    await Future.delayed(const Duration(seconds: 4));
    print("Removing token from the server");
    return;
  }
}

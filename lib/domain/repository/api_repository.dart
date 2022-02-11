import 'package:delivery_app/domain/request/login_request.dart';
import 'package:delivery_app/domain/response/login_response.dart';

import '../model/user.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<void> logout(String token);
}

import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = "TOKEN";
const _pref_username = "USERNAME";
const _pref_name = "NAME";
const _pref_image = "IMAGE";
const _pref_darktTheme = "IMAGE";

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }

  @override
  Future<String?> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.getString(_pref_username);
    final image = sharedPreferences.getString(_pref_image);
    final name = sharedPreferences.getString(_pref_name);
    return User(name: name!, username: username!, image: image);
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.setString(_pref_username, user.username);
    final image = sharedPreferences.setString(_pref_image, user.image!);
    final name = sharedPreferences.setString(_pref_name, user.name);
    return user;
  }

  @override
  Future<bool?> getDarkMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_pref_darktTheme);
  }

  @override
  Future<void> saveDarkMode(bool darkMode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_pref_darktTheme, darkMode);
    return;
  }
}

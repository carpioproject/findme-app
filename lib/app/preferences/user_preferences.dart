import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String TOKEN_STRING = 'token';
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _preferences;

  initPreferences() async {
    this._preferences = await SharedPreferences.getInstance();
  }

  String get token {
    return _preferences.getString(TOKEN_STRING) ?? '';
  }

  set token(String value) {
    _preferences.setString(TOKEN_STRING, value);
  }
}

import 'package:ebll_mall/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // auth
  static const String emailKey = 'emailKey';
  static const String passwordKey = 'passwordKey';
  static const String userKey = 'userKey';
  static const String idUser = 'idUser';
  static const String phoneKey = 'phoneKey';
  static const String nameKey = 'nameKey';
  static const String whatsappNumberKey = 'whatsappNumberKey';
  static const String addressKey = 'addressKey';
  static const String tokenKey = 'tokenKey';
  static const String imgKey = 'imgKey';
  //
  static const String loginKey = 'loginKey';
  static const bool isLoginIn = false;
  static late SharedPreferences _preferences;
  //
  static Future initLocalStorage() async {
    //
    print('initLocalStorage()');
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setLogin(bool value) async {
    await _preferences.setBool(loginKey, value);
  }

  static Future<void> setBoolPref(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  static bool getBoolValPrefs(String key) {
    return _preferences.getBool(key) ?? false;
  }

  // section AUTH
  static Future<void> seveUserModelInPrefs(
      {required UserModel userModel}) async {
    //
    await _preferences.setInt(idUser, userModel.id ?? 0);
    await _preferences.setString(phoneKey, userModel.phone ?? '');
    await _preferences.setString(nameKey, userModel.name ?? '');
    await _preferences.setString(emailKey, userModel.email ?? '');
    await _preferences.setString(tokenKey, userModel.accessToken ?? '');
    await _preferences.setString(
        whatsappNumberKey, userModel.whatsappNumber ?? '');
    await _preferences.setString(addressKey, userModel.address ?? '');
    await _preferences.setString(imgKey, userModel.img ?? '');
    // await _preferences.setString(passwordKey, userModel.password ?? '');
  }

  static UserModel getUserModelFromPrefs() {
    //
    return UserModel(
      id: _preferences.getInt(idUser) ?? 0,
      name: _preferences.getString(nameKey) ?? '',
      email: _preferences.getString(emailKey) ?? '',
      phone: _preferences.getString(phoneKey) ?? '',
      address: _preferences.getString(addressKey) ?? '',
      whatsappNumber: _preferences.getString(whatsappNumberKey) ?? '',
      accessToken: _preferences.getString(tokenKey) ?? '',
      img: _preferences.getString(imgKey) ?? '',
    );
  }

  static String get getToekn => _preferences.getString(tokenKey) ?? '';
  // End Section AUTH

  static bool checkLogin() {
    // return false;
    return _preferences.getBool(loginKey) ?? false;
  }

  static setValPrefs({required String key, required String value}) async {
    await _preferences.setString(key, value);
  }

  static clearToken() async {
    await _preferences.setString(tokenKey, '');
  }

  static String getValPrefs(String key) {
    return _preferences.getString(key) ?? '';
  }

  static Future<void> logout() async {
    await _preferences.setBool(loginKey, false);
  }

  static Future<void> clearObjPrefs() async => _preferences.clear();
  //
  static Future<void> resetPresSetting() async {
    await _preferences.clear();
    await logout();
    await clearToken();
  }
  //
}

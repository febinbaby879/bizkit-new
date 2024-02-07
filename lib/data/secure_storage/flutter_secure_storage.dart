import 'package:bizkit/domain/model/token/token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const String accessKey = 'access_key';
  static const String refreshKey = 'refresh_key';
  static const String idKey = 'user_id_key';
  static const String isLoged = 'is_logedIn';

  static const secureStorage = FlutterSecureStorage();

  static Future<void> saveToken({required TokenModel tokenModel}) async {
    await secureStorage.write(
        key: accessKey, value: tokenModel.accessToken ?? '');
    await secureStorage.write(
        key: refreshKey, value: tokenModel.refreshToken ?? '');
    await secureStorage.write(
        key: idKey,
        value: tokenModel.id != null ? tokenModel.id.toString() : '');
  }

  static Future<TokenModel> getToken() async {
    final accessToken = await secureStorage.read(key: accessKey);
    final refreshToken = await secureStorage.read(key: refreshKey);
    return TokenModel(accessToken: accessToken, refreshToken: refreshToken);
  }

  static Future<void> setAccessToken({required String accessToken}) async {
    await secureStorage.write(key: accessKey, value: accessToken);
  }

  static Future<void> setLogin() async {
    await secureStorage.write(key: isLoged, value: '1');
  }

  static Future<void> clearLogin() async {
    await secureStorage.deleteAll();
  }

  static Future<bool> getLogin() async {
    final login = await secureStorage.read(key: isLoged);
    return login == '1';
  }

  static Future<int?> getUSerId() async {
    final id = await secureStorage.read(key: idKey);
    return id == '' || id == null ? null : int.parse(id);
  }
}

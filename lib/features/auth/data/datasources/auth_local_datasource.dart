import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/constants/storage_keys.dart';
import '../../../../core/constants/strings.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUserCredentials({
    required String userId,
    required String password,
    required String email,
    required String phone,
  });
  Future<bool> validateCredentials({
    required String userId,
    required String password,
  });
  Future<void> setLoggedIn(String userId);
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<String?> getCurrentUserId();
  Future<Map<String, dynamic>?> getUserData(String userId);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<void> saveUserCredentials({
    required String userId,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      final hashedPassword = _hashPassword(password);
      final userData = {
        'userId': userId,
        'email': email,
        'phone': phone,
        'createdAt': DateTime.now().toIso8601String(),
      };

      await sharedPreferences.setString(StorageKeys.getUserPasswordKey(userId), hashedPassword);
      await sharedPreferences.setString(StorageKeys.getUserDataKey(userId), jsonEncode(userData));
    } catch (e) {
      throw CacheException('${Strings.errorSaveCredentials}: $e');
    }
  }

  @override
  Future<bool> validateCredentials({
    required String userId,
    required String password,
  }) async {
    try {
      final storedHashedPassword = sharedPreferences.getString(StorageKeys.getUserPasswordKey(userId));
      if (storedHashedPassword == null) {
        return false; // User doesn't exist
      }

      final hashedInputPassword = _hashPassword(password);
      return storedHashedPassword == hashedInputPassword;
    } catch (e) {
      throw CacheException('${Strings.errorValidateCredentials}: $e');
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      final userDataString = sharedPreferences.getString(StorageKeys.getUserDataKey(userId));
      if (userDataString == null) {
        return null;
      }
      return jsonDecode(userDataString) as Map<String, dynamic>;
    } catch (e) {
      throw CacheException('${Strings.errorGetUserData}: $e');
    }
  }

  @override
  Future<void> setLoggedIn(String userId) async {
    try {
      await sharedPreferences.setBool(StorageKeys.isLoggedIn, true);
      await sharedPreferences.setString(StorageKeys.currentUserId, userId);
    } catch (e) {
      throw CacheException('${Strings.errorSaveLoginState}: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await sharedPreferences.setBool(StorageKeys.isLoggedIn, false);
      await sharedPreferences.remove(StorageKeys.currentUserId);
    } catch (e) {
      throw CacheException('${Strings.errorClearLoginState}: $e');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      return sharedPreferences.getBool(StorageKeys.isLoggedIn) ?? false;
    } catch (e) {
      throw CacheException('${Strings.errorCheckLoginState}: $e');
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    try {
      return sharedPreferences.getString(StorageKeys.currentUserId);
    } catch (e) {
      throw CacheException('${Strings.errorGetCurrentUserId}: $e');
    }
  }
}
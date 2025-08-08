import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';

abstract class AuthLocalDataSource {
  Future<void> setLoggedIn(String userId);
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<String?> getCurrentUserId();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyUserId = 'user_id';

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> setLoggedIn(String userId) async {
    try {
      await sharedPreferences.setBool(_keyIsLoggedIn, true);
      await sharedPreferences.setString(_keyUserId, userId);
    } catch (e) {
      throw CacheException('Failed to save login state: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await sharedPreferences.clear();
    } catch (e) {
      throw CacheException('Failed to clear login state: $e');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      return sharedPreferences.getBool(_keyIsLoggedIn) ?? false;
    } catch (e) {
      throw CacheException('Failed to check login state: $e');
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    try {
      return sharedPreferences.getString(_keyUserId);
    } catch (e) {
      throw CacheException('Failed to get current user ID: $e');
    }
  }
}